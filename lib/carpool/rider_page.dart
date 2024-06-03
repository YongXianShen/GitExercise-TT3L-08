import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:mmusuperapp/appInfo/app_info.dart';

import '../methods/common_methods.dart';

class RiderPage extends StatefulWidget {
  const RiderPage({super.key});

  @override
  State<RiderPage> createState() => _RiderPageState();
}

class _RiderPageState extends State<RiderPage> {
  bool isNightMode = false;
  GoogleMapController? mapController;
  Set<Marker> driverMarkers = {};

  void updateMapTheme() {
    if (mapController != null) {
      if (isNightMode) {
        mapController!.setMapStyle('YOUR_NIGHT_STYLE_JSON');
      } else {
        mapController!.setMapStyle('YOUR_DAY_STYLE_JSON');
      }
    }
  }

  void fetchNearbyDrivers() async {
    // Replace with your logic to fetch nearby drivers within 3km
    // For example:
    var drivers = await CommonMethods.getNearbyDrivers();

    setState(() {
      driverMarkers = drivers.map((driver) {
        return Marker(
          markerId: MarkerId(driver.id),
          position: LatLng(driver.latitude, driver.longitude),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
          onTap: () {
            // Show driver details pop-up
            showDriverDetails(driver);
          },
        );
      }).toSet();
    });
  }

  void showDriverDetails(driver) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(driver.name),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Car: ${driver.carDetails}'),
              Text('Destination: ${driver.destination}'),
              Text('Payment: RM${driver.payment}'),
              ElevatedButton(
                onPressed: () {
                  // Handle request button click
                },
                child: Text('Request'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    fetchNearbyDrivers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isNightMode ? Colors.black : Colors.white,
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: CameraPosition(
              target: LatLng(37.7749, -122.4194), // Example coordinates, replace with actual
              zoom: 12,
            ),
            onMapCreated: (GoogleMapController controller) {
              mapController = controller;
              updateMapTheme();
            },
            markers: driverMarkers,
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
                  onPressed: () {
                    setState(() {
                      isNightMode = !isNightMode;
                      updateMapTheme();
                    });
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
