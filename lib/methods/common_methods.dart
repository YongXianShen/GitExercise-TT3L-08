import 'dart:collection';
import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter_platform_interface/src/types/location.dart';
import 'package:mmusuperapp/appInfo/app_info.dart';
import 'package:mmusuperapp/global/global_var.dart';
import 'package:http/http.dart' as http;
import 'package:mmusuperapp/models/address_model.dart';
import 'package:provider/provider.dart';

import '../models/direction_details.dart';

class CommonMethods
{
  displaySnackBar(String messageText, BuildContext context) {
    var snackBar = SnackBar(content: Text(messageText));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static sendRequestToAPI(String apiUrl) async
  {
    http.Response responseFromAPI = await http.get(Uri.parse(apiUrl));

   try
   {
     if(responseFromAPI.statusCode == 200)
       {
         String dataFromApi = responseFromAPI.body;
         var dataDecoded = jsonDecode(dataFromApi);
         return dataDecoded;
       }
       else
       {
         return "error";
       }
   }
   catch(errorMsg)
   {
     return "error";
   }
  }
  ///Reverse GeoCoding
  static Future<String> convertGeoGraphicCoordinatesIntoHumanReadableAddress(Position position, BuildContext context) async
  {
    String humanReadableAddress = "";
    String apiGeoCodingUrl = "https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=$googleMapKey";

    var responseFromAPI = await sendRequestToAPI(apiGeoCodingUrl);

    if(responseFromAPI != "error")
    {
      humanReadableAddress = responseFromAPI["results"][0]["formatted_address"];

      AddressModel model = AddressModel();
      model.humanReadableAddress = humanReadableAddress;
      model.longitudePosition = position.longitude;
      model.latitudePosition = position.latitude;

      Provider.of<AppInfo>(context, listen: false).updatePickUpLocation(model);
    }

    return humanReadableAddress;
  }

  ///Directions API
  static Future<DirectionDetails?> getDirectionDetailsFromAPI(LatLng source, LatLng destination) async
  {
    String urlDirectionsAPI = "https://maps.googleapis.com/maps/api/directions/json?destination=${destination.latitude},${destination.longitude}&origin=${source.latitude},${source.longitude}&mode=driving&key=$googleMapKey";

    var responseFromDirectionsAPI = await sendRequestToAPI(urlDirectionsAPI);

    if(responseFromDirectionsAPI == "error")
    {
      return null;
    }

    DirectionDetails detailsModel = DirectionDetails();

    detailsModel.distanceTextString = responseFromDirectionsAPI["routes"][0]["legs"][0]["distance"]["text"];
    detailsModel.distanceValueDigits = responseFromDirectionsAPI["routes"][0]["legs"][0]["distance"]["value"];

    detailsModel.durationTextString = responseFromDirectionsAPI["routes"][0]["legs"][0]["duration"]["text"];
    detailsModel.durationValueDigits = responseFromDirectionsAPI["routes"][0]["legs"][0]["duration"]["value"];

    detailsModel.encodedPoints = responseFromDirectionsAPI["routes"][0]["overview_polyline"]["points"];

    return detailsModel;
  }
  calculateFareAmount(DirectionDetails directionDetails)
  {
    double distancePerKmAmount = 0.4;
    double durationPerMinuteAmount = 0.3;
    double baseFareAmount = 2;

    double totalDistanceTravelFareAmount = (directionDetails.distanceValueDigits! / 1000) * distancePerKmAmount;
    double totalDurationSpendFareAmount = (directionDetails.durationValueDigits! / 60) * durationPerMinuteAmount;

    double overAllTotalFareAmount = baseFareAmount + totalDistanceTravelFareAmount + totalDurationSpendFareAmount;

    return overAllTotalFareAmount.toStringAsFixed(1);
  }

  static Future<List<Driver>> getNearbyDrivers() async {
    return [
      Driver(id: '1', name: 'Driver 1', latitude: 37.7749, longitude: -122.4194, carDetails: 'Car 1', destination: 'Destination 1', payment: 50),
      Driver(id: '2', name: 'Driver 2', latitude: 37.7849, longitude: -122.4294, carDetails: 'Car 2', destination: 'Destination 2', payment: 60),
    ];
  }
}

class Driver {
  final String id;
  final String name;
  final double latitude;
  final double longitude;
  final String carDetails;
  final String destination;
  final double payment;

  Driver({required this.id, required this.name, required this.latitude, required this.longitude, required this.carDetails, required this.destination, required this.payment});
}

class CarpoolRequest {
  final String name;
  final int age;
  final String gender;
  final String carModel;
  final String carColor;
  final String carPlate;
  final String pickupPoint;

  CarpoolRequest({
    required this.name,
    required this.age,
    required this.gender,
    required this.carModel,
    required this.carColor,
    required this.carPlate,
    required this.pickupPoint,
  });
}


