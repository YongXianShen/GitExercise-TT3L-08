import 'package:flutter/material.dart';

void carpool() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext
  context) {
    return MaterialApp(
      title: 'Carpool',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: OfferRide(),
    );
  }
}

class OfferRide extends
    StatefulWidget {
  _OfferRideState createState() =>
      _OfferRideState();
}

class _OfferRideState extends
    State<OfferRide> {
  bool isOfferingRide = false;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carpool'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => setState(() => isOfferingRide = !isOfferingRide),
        child: Text(isOfferingRide? ' Find Ride': 'Offer Ride'))],
        ),
      ),
    );
  }

}
