import 'dart:async';
import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mmusuperapp/appInfo/app_info.dart';
import 'package:mmusuperapp/global/global_var.dart';
import 'package:mmusuperapp/methods/common_methods.dart';
import 'package:mmusuperapp/models/direction_details.dart';
import 'package:mmusuperapp/pages/search_destination_page.dart';
import 'package:provider/provider.dart';

class CarpoolDetails extends StatefulWidget {
  const CarpoolDetails({super.key});

  @override
  State<CarpoolDetails> createState() => _CarpoolDetailsState();
}

class _CarpoolDetailsState extends State<CarpoolDetails> {
  final Completer<GoogleMapController> googleMapCompleterController = Completer<GoogleMapController>();
  GoogleMapController? controllerGoogleMap;
  Position? currentPositionOfUser;
  GlobalKey<ScaffoldState> sKey = GlobalKey<ScaffoldState>();
  CommonMethods cMethods = CommonMethods();
  double searchContainerHeight = 276;
  double bottomMapPadding = 0;
  bool isNightMode = false;
  double rideDetailsContainerHeight = 0;
  List<LatLng> polylineCoordinates = [];
  Set<Polyline> polylineSet = {};
  Set<Marker> markerSet = {};
  Set<Circle> circleSet = {};
  DirectionDetails? tripDirectionDetailsInfo;
  String titleToShow = "GO ONLINE NOW";
  bool isDriverAvailable = false;
  Color colorToShow = Colors.green;

  void updateMapTheme(GoogleMapController controller) {
    getJsonFileFromThemes("themes/blue_style.json").then((value) {
      setGoogleMapStyle(value, controller);
    }).catchError((error) {
      print('Error loading map theme: $error');
    });
  }

  void updateMapThemeToNight(GoogleMapController controller) {
    getJsonFileFromThemes("themes/night_style.json").then((value) {
      setGoogleMapStyle(value, controller);
    }).catchError((error) {
      print('Error loading night map theme: $error');
    });
  }

  Future<String> getJsonFileFromThemes(String mapStylePath) async {
    try {
      ByteData byteData = await rootBundle.load(mapStylePath);
      var list = byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);
      return utf8.decode(list);
    } catch (error) {
      print('Error loading map style: $error');
      rethrow;
    }
  }

  void setGoogleMapStyle(String googleMapStyle, GoogleMapController controller) {
    controller.setMapStyle(googleMapStyle).catchError((error) {
      print('Error setting map style: $error');
    });
  }

  Future<void> getCurrentLiveLocationOfDriver() async {
    try {
      Position positionOfUser = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.bestForNavigation);
      setState(() {
        currentPositionOfUser = positionOfUser;
      });

      LatLng positionOfUserInLatLng = LatLng(currentPositionOfUser!.latitude, currentPositionOfUser!.longitude);

      CameraPosition cameraPosition = CameraPosition(target: positionOfUserInLatLng, zoom: 15);
      controllerGoogleMap?.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));

      await CommonMethods.convertGeoGraphicCoordinatesIntoHumanReadableAddress(currentPositionOfUser!, context);
    } catch (e) {
      print('Error getting current location: $e');
    }
  }

  void toggleMapStyle() {
    if (controllerGoogleMap != null) {
      if (isNightMode) {
        updateMapTheme(controllerGoogleMap!);
      } else {
        updateMapThemeToNight(controllerGoogleMap!);
      }
      setState(() {
        isNightMode = !isNightMode;
      });
    }
  }

  void displayUserRideDetailsContainer() async {
    try {
      await retrieveDirectionDetails();
      setState(() {
        searchContainerHeight = 0;
        bottomMapPadding = 240;
        rideDetailsContainerHeight = 242;
      });
    } catch (e) {
      print('Error displaying ride details: $e');
    }
  }

  Future<void> retrieveDirectionDetails() async {
    try {
      var pickUpLocation = Provider.of<AppInfo>(context, listen: false).pickupLocation;
      var dropOffDestinationLocation = Provider.of<AppInfo>(context, listen: false).dropOffLocation;

      if (pickUpLocation == null || dropOffDestinationLocation == null) {
        print('PickUp or DropOff location is null');
        return;
      }

      var pickupGeoGraphicCoOrdinates = LatLng(pickUpLocation.latitudePosition!, pickUpLocation.longitudePosition!);
      var dropOffDestinationGeoGraphicCoOrdinates = LatLng(dropOffDestinationLocation.latitudePosition!, dropOffDestinationLocation.longitudePosition!);

      var detailsFromDirectionAPI = await CommonMethods.getDirectionDetailsFromAPI(pickupGeoGraphicCoOrdinates, dropOffDestinationGeoGraphicCoOrdinates);
      setState(() {
        tripDirectionDetailsInfo = detailsFromDirectionAPI;
      });

      PolylinePoints pointsPolyline = PolylinePoints();
      List<PointLatLng> latLngPointsFromPickUpToDestination = pointsPolyline.decodePolyline(tripDirectionDetailsInfo!.encodedPoints!);

      polylineCoordinates.clear();
      if (latLngPointsFromPickUpToDestination.isNotEmpty) {
        latLngPointsFromPickUpToDestination.forEach((PointLatLng latLngPoint) {
          polylineCoordinates.add(LatLng(latLngPoint.latitude, latLngPoint.longitude));
        });
      }

      polylineSet.clear();
      setState(() {
        Polyline polyline = Polyline(
          polylineId: const PolylineId("polylineID"),
          color: Colors.blue,
          points: polylineCoordinates,
          jointType: JointType.round,
          width: 4,
          startCap: Cap.roundCap,
          endCap: Cap.roundCap,
          geodesic: true,
        );

        polylineSet.add(polyline);
      });

      LatLngBounds boundsLatLng;
      if (pickupGeoGraphicCoOrdinates.latitude > dropOffDestinationGeoGraphicCoOrdinates.latitude &&
          pickupGeoGraphicCoOrdinates.longitude > dropOffDestinationGeoGraphicCoOrdinates.longitude) {
        boundsLatLng = LatLngBounds(
          southwest: dropOffDestinationGeoGraphicCoOrdinates,
          northeast: pickupGeoGraphicCoOrdinates,
        );
      } else if (pickupGeoGraphicCoOrdinates.longitude > dropOffDestinationGeoGraphicCoOrdinates.longitude) {
        boundsLatLng = LatLngBounds(
          southwest: LatLng(pickupGeoGraphicCoOrdinates.latitude, dropOffDestinationGeoGraphicCoOrdinates.longitude),
          northeast: LatLng(dropOffDestinationGeoGraphicCoOrdinates.latitude, pickupGeoGraphicCoOrdinates.longitude),
        );
      } else if (pickupGeoGraphicCoOrdinates.latitude > dropOffDestinationGeoGraphicCoOrdinates.latitude) {
        boundsLatLng = LatLngBounds(
          southwest: LatLng(dropOffDestinationGeoGraphicCoOrdinates.latitude, pickupGeoGraphicCoOrdinates.longitude),
          northeast: LatLng(pickupGeoGraphicCoOrdinates.latitude, dropOffDestinationGeoGraphicCoOrdinates.longitude),
        );
      } else {
        boundsLatLng = LatLngBounds(
          southwest: pickupGeoGraphicCoOrdinates,
          northeast: dropOffDestinationGeoGraphicCoOrdinates,
        );
      }
      controllerGoogleMap!.animateCamera(CameraUpdate.newLatLngBounds(boundsLatLng, 72));


      Marker dropOffDestinationPointMarker = Marker(
        markerId: const MarkerId("dropOffDestinationPointMarkerID"),
        position: dropOffDestinationGeoGraphicCoOrdinates,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        infoWindow: InfoWindow(title: dropOffDestinationLocation.placeName, snippet: "Destination Location"),
      );

      setState(() {
        markerSet.add(dropOffDestinationPointMarker);
      });

      Circle pickUpPointCircle = Circle(
        circleId: const CircleId('pickupCircleID'),
        strokeColor: Colors.blue,
        strokeWidth: 4,
        radius: 14,
        center: pickupGeoGraphicCoOrdinates,
        fillColor: Colors.lightBlueAccent,
      );

      Circle dropOffDestinationPointCircle = Circle(
        circleId: const CircleId('dropOffDestinationCircleID'),
        strokeColor: Colors.blue,
        strokeWidth: 4,
        radius: 14,
        center: dropOffDestinationGeoGraphicCoOrdinates,
        fillColor: Colors.lightBlueAccent,
      );

      setState(() {
        circleSet.add(pickUpPointCircle);
        circleSet.add(dropOffDestinationPointCircle);
      });
    } catch (e) {
      print('Error retrieving direction details: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isNightMode ? Colors.black : Colors.white,
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            myLocationEnabled: true,
            initialCameraPosition: googlePlexInitialPosition,
            onMapCreated: (GoogleMapController mapController) {
              controllerGoogleMap = mapController;
              updateMapTheme(controllerGoogleMap!);
              googleMapCompleterController.complete(controllerGoogleMap);
              getCurrentLiveLocationOfDriver();
            },
            polylines: polylineSet,
            markers: markerSet,
            circles: circleSet,
            padding: EdgeInsets.only(bottom: bottomMapPadding),
          ),
          Positioned(
            left: 0,
            top: 0,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  icon: Icon(isNightMode ? Icons.wb_sunny : Icons.nights_stay),
                  color: isNightMode ? Colors.white : Colors.black,
                  onPressed: toggleMapStyle,
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: isNightMode ? Colors.black : Colors.white,
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 5.0,
                    spreadRadius: 1.0,
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "List Your Destination",
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  SizedBox(
                    width: 350,
                    child: ElevatedButton(
                      onPressed: () async {
                        var responseFromSearchPage = await Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SearchDestinationPage()),
                        );

                        if (responseFromSearchPage == "placeSelected") {
                          displayUserRideDetailsContainer();
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        padding: const EdgeInsets.all(16),
                      ),
                      child: const Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: rideDetailsContainerHeight,
              decoration: BoxDecoration(
                color: isNightMode ? Colors.black54 : Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    spreadRadius: 0.5,
                    offset: Offset(.7, .7),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: SizedBox(
                  height: 190,
                  child: Card(
                    elevation: 10,
                    color: isNightMode ? Colors.black : Colors.white,
                    child: Container(
                      width: MediaQuery.of(context).size.width * .70,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.directions_car,
                              color: isNightMode ? Colors.white : Colors.black,
                              size: 80,
                            ),
                            SizedBox(height: 8),
                            Text(
                              "Heading to Destination",
                              style: TextStyle(
                                fontSize: 18,
                                color: isNightMode ? Colors.white : Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "Carpool requests will pop up if any are available.",
                              style: TextStyle(
                                fontSize: 14,
                                color: isNightMode ? Colors.grey : Colors.black54,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 61,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        isDismissible: false,
                        builder: (BuildContext context) {
                          return Container(
                            decoration: const BoxDecoration(
                              color: Colors.black,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 5.0,
                                  spreadRadius: 0.5,
                                  offset: Offset(
                                    0.7,
                                    0.7,
                                  ),
                                ),
                              ],
                            ),
                            height: 221,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
                              child: Column(
                                children: [
                                  const SizedBox(height: 11),
                                  Text(
                                    (!isDriverAvailable) ? "GO ONLINE NOW" : "GO OFFLINE NOW",
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontSize: 22,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 21),
                                  Text(
                                    (!isDriverAvailable)
                                        ? "You are about to go online, you will become available to receive trip requests from users."
                                        : "You are about to go offline, you will stop receiving new trip requests from users.",
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(height: 25),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: const Text("BACK"),
                                        ),
                                      ),
                                      const SizedBox(width: 16),
                                      Expanded(
                                        child: ElevatedButton(
                                          onPressed: () {
                                            if (!isDriverAvailable) {
                                              // Go Online
                                              // Get driver location updates

                                              Navigator.pop(context);

                                              setState(() {
                                                colorToShow = Colors.redAccent;
                                                titleToShow = "GO OFFLINE NOW";
                                                isDriverAvailable = true;
                                              });
                                            } else {
                                              // Go Offline

                                              Navigator.pop(context);

                                              setState(() {
                                                colorToShow = Colors.green;
                                                titleToShow = "GO ONLINE NOW";
                                                isDriverAvailable = false;
                                              });
                                            }
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: (titleToShow == "GO ONLINE NOW")
                                                ? Colors.green
                                                : Colors.redAccent,

                                          ),
                                          child: const Text(
                                            "CONFIRM",
                                          style: TextStyle(color: Colors.white,
                                          )
                                          )
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorToShow,
                  ),
                  child: Text(
                    titleToShow,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
