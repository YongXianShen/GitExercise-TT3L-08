import 'dart:async';
import 'dart:convert';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mmusuperapp/appInfo/app_info.dart';
import 'package:mmusuperapp/global/global_var.dart';
import 'package:mmusuperapp/methods/common_methods.dart';
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

  void updateMapTheme(GoogleMapController controller) {
    getJsonFileFromThemes("themes/blue_style.json").then((value) => setGoogleMapStyle(value, controller));
  }

  void updateMapThemeToNight(GoogleMapController controller) {
    getJsonFileFromThemes("themes/night_style.json").then((value) => setGoogleMapStyle(value, controller));
  }

  Future<String> getJsonFileFromThemes(String mapStylePath) async {
    ByteData byteData = await rootBundle.load(mapStylePath);
    var list = byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);
    return utf8.decode(list);
  }

  void setGoogleMapStyle(String googleMapStyle, GoogleMapController controller) {
    controller.setMapStyle(googleMapStyle);
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
    } catch (e) {
      print(e);
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

  void displayUserRideDetailsContainer() {
    setState(() {
      searchContainerHeight = 0;
      bottomMapPadding = 240;
      rideDetailsContainerHeight = 242;
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
                borderRadius: BorderRadius.circular(0.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 5.0,
                    spreadRadius: 1.0,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20.0),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 95.0, left: 45.0),
                          child: Text(
                            "List Your Destination",
                            style: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
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
              height: searchContainerHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
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
              decoration: const BoxDecoration(
                color: Colors.black54,
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
                    child: Container(
                      width: MediaQuery.of(context).size.width * .70,
                      color: Colors.black,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.directions_car,
                              color: Colors.white,
                              size: 80,
                            ),
                            SizedBox(height: 8),
                            Text(
                              "Heading to Destination",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "Carpool requests will pop up if any are available.",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
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
        ],
      ),
    );
  }
}
