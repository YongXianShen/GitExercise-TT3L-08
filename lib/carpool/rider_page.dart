import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_geofire/flutter_geofire.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mmusuperapp/appInfo/app_info.dart';
import 'package:mmusuperapp/global/global_var.dart';
import 'package:mmusuperapp/methods/common_methods.dart';
import 'package:mmusuperapp/models/direction_details.dart';
import 'package:provider/provider.dart';

import '../global/trip_var.dart';
import '../methods/manage_drivers_methods.dart';
import '../pages/driver_listings.dart';
import '../pages/search_destination_page.dart';
import 'online_nearby_drivers.dart';

class RiderPage extends StatefulWidget {
  const RiderPage({super.key,

  });

  @override
  State<RiderPage> createState() => _RiderPageState();
}

class _RiderPageState extends State<RiderPage> {
  final Completer<GoogleMapController> googleMapCompleterController = Completer<GoogleMapController>();
  GoogleMapController? controllerGoogleMap;
  Position? currentPositionOfUser;
  GlobalKey<ScaffoldState> sKey = GlobalKey<ScaffoldState>();
  CommonMethods cMethods = CommonMethods();
  double bottomMapPadding = 0;
  bool isNightMode = false;
  double rideDetailsContainerHeight = 0;
  List<LatLng> polylineCoOrdinates = [];
  Set<Polyline> polylineSet = {};
  Set<Marker> markerSet = {};
  Set<Circle> circleSet = {};
  DirectionDetails? tripDirectionDetailsInfo;
  bool nearbyOnlineDriversKeysLoaded = false;
  BitmapDescriptor? carIconNearbyDriver;
  String stateOfApp = "normal";
  double tripContainerHeight = 0;
  double requestContainerHeight = 0;
  bool isDrawerOpened = true;
  double searchContainerHeight = 276;

  List<CarpoolRequest> carpoolRequests = [];

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

  Future<void> getCurrentLiveLocationOfUser() async {
    try {
      Position positionOfUser = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.bestForNavigation);
      setState(() {
        currentPositionOfUser = positionOfUser;
      });

      LatLng positionOfUserInLatLng = LatLng(currentPositionOfUser!.latitude, currentPositionOfUser!.longitude);

      CameraPosition cameraPosition = CameraPosition(target: positionOfUserInLatLng, zoom: 15);
      controllerGoogleMap?.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));

      await CommonMethods.convertGeoGraphicCoordinatesIntoHumanReadableAddress(currentPositionOfUser!, context);

      await initializeGeoFireListener();
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

  Future<void> retrieveDirectionDetails() async {
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

    polylineSet.clear();
    if (latLngPointsFromPickUpToDestination.isNotEmpty) {
      latLngPointsFromPickUpToDestination.forEach((PointLatLng latLngPoint) {
        polylineCoOrdinates.add(LatLng(latLngPoint.latitude, latLngPoint.longitude));
      });
    }

    Polyline polyline = Polyline(
      polylineId: const PolylineId("polylineID"),
      color: Colors.pink,
      points: polylineCoOrdinates,
      jointType: JointType.round,
      width: 4,
      startCap: Cap.roundCap,
      endCap: Cap.roundCap,
      geodesic: true,
    );

    setState(() {
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

    Marker pickUpPointMarker = Marker(
      markerId: const MarkerId("pickUpPointMarkerID"),
      position: pickupGeoGraphicCoOrdinates,
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      infoWindow: InfoWindow(title: pickUpLocation.placeName, snippet: "Pickup Location"),
    );

    Marker dropOffDestinationPointMarker = Marker(
      markerId: const MarkerId("dropOffDestinationPointMarkerID"),
      position: dropOffDestinationGeoGraphicCoOrdinates,
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
      infoWindow: InfoWindow(title: dropOffDestinationLocation.placeName, snippet: "Destination Location"),
    );

    setState(() {
      markerSet.add(pickUpPointMarker);
      markerSet.add(dropOffDestinationPointMarker);
    });

    Circle pickUpPointCircle = Circle(
      circleId: const CircleId('pickupCircleID'),
      strokeColor: Colors.blue,
      strokeWidth: 4,
      radius: 14,
      center: pickupGeoGraphicCoOrdinates,
      fillColor: Colors.pink,
    );

    Circle dropOffDestinationPointCircle = Circle(
      circleId: const CircleId('dropOffDestinationCircleID'),
      strokeColor: Colors.blue,
      strokeWidth: 4,
      radius: 14,
      center: dropOffDestinationGeoGraphicCoOrdinates,
      fillColor: Colors.pink,
    );
    setState(() {
      circleSet.add(pickUpPointCircle);
      circleSet.add(dropOffDestinationPointCircle);
    });
  }

  resetAppNow() {
    setState(() {
      polylineCoOrdinates.clear();
      polylineSet.clear();
      markerSet.clear();
      circleSet.clear();
      rideDetailsContainerHeight = 0;
      requestContainerHeight = 0;
      tripContainerHeight = 0;
      searchContainerHeight = 276;
      bottomMapPadding = 300;
      isDrawerOpened = true;

      status = "";
      nameDriver = "";
      photoDriver = "";
      phoneNumberDriver = "";
      carDetailsDriver = "";
      tripStatusDisplay = 'Driver is Arriving';
    });
  }

  cancelRideRequest() {
    // remove ride request from database

    setState(() {
      stateOfApp = "normal";
    });
  }

  displayRequestContainer() {
    setState(() {
      rideDetailsContainerHeight = 0;
      requestContainerHeight = 220;
      bottomMapPadding = 200;
      isDrawerOpened = true;
    });

    // send ride request
  }

  updateAvailableNearbyOnlineDriversOnMap() {
    setState(() {
      markerSet.clear();
    });

    Set<Marker> markersTempSet = Set<Marker>();

    for (OnlineNearbyDrivers eachOnlineNearbyDriver in ManageDriversMethods.nearbyOnlineDriversList) {
      LatLng driverCurrentPosition = LatLng(eachOnlineNearbyDriver.latDriver!, eachOnlineNearbyDriver.lngDriver!);

      Marker driverMarker = Marker(
        markerId: MarkerId("driver ID = " + eachOnlineNearbyDriver.uidDriver.toString()),
        position: driverCurrentPosition,
        icon: carIconNearbyDriver!,
      );

      markersTempSet.add(driverMarker);
    }

    setState(() {
      markerSet = markersTempSet;
    });
  }

  initializeGeoFireListener() {
    Geofire.initialize("onlineDrivers");
    Geofire.queryAtLocation(currentPositionOfUser!.latitude, currentPositionOfUser!.longitude, 22)!
        .listen((driverEvent) {
      if (driverEvent != null) {
        var onlineDriverChild = driverEvent["callBack"];

        switch (onlineDriverChild) {
          case Geofire.onKeyEntered:
            OnlineNearbyDrivers onlineNearbyDrivers = OnlineNearbyDrivers();
            onlineNearbyDrivers.uidDriver = driverEvent["key"];
            onlineNearbyDrivers.latDriver = driverEvent["latitude"];
            onlineNearbyDrivers.lngDriver = driverEvent["longitude"];
            ManageDriversMethods.nearbyOnlineDriversList.add(onlineNearbyDrivers);

            if (nearbyOnlineDriversKeysLoaded == true) {
              updateAvailableNearbyOnlineDriversOnMap();
            }

            break;

          case Geofire.onKeyExited:
            ManageDriversMethods.removeDriverFromList(driverEvent["key"]);
            updateAvailableNearbyOnlineDriversOnMap();
            break;

          case Geofire.onKeyMoved:
            OnlineNearbyDrivers onlineNearbyDrivers = OnlineNearbyDrivers();
            onlineNearbyDrivers.uidDriver = driverEvent["key"];
            onlineNearbyDrivers.latDriver = driverEvent["latitude"];
            onlineNearbyDrivers.lngDriver = driverEvent["longitude"];
            ManageDriversMethods.updateOnlineNearbyDriversLocation(onlineNearbyDrivers);
            updateAvailableNearbyOnlineDriversOnMap();
            break;

          case Geofire.onGeoQueryReady:
            nearbyOnlineDriversKeysLoaded = true;
            updateAvailableNearbyOnlineDriversOnMap();
            break;
        }
      }
    });
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
              getCurrentLiveLocationOfUser();
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
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: Column(
                      children: [
                        Icon(Icons.directions_car, color: Colors.grey, size: 80),
                        SizedBox(height: 20),
                        Text('Finding Nearby Driver', style: TextStyle(fontSize: 20, color: Colors.black,fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () async {
                      var responseFromSearchPage = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SearchDestinationPage()),
                      );
                      if (responseFromSearchPage == "placeSelected") {
                        var result = await Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DriverListPage())
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                    child: Text('Check Drivers', style: TextStyle(fontSize: 16, color: Colors.white)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

