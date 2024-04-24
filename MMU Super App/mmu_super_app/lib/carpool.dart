import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext
  context) {
    return MaterialApp(
      title: 'Carpool',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const OfferRide(),
    );
  }
}

class OfferRide extends
    StatefulWidget {
  const OfferRide({super.key});

  @override
  _OfferRideState createState() =>
      _OfferRideState();
}

class _OfferRideState extends
    State<OfferRide> {
  bool isOfferingRide = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent ,
        title: const Text('Carpool'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => setState(() => isOfferingRide = !isOfferingRide),
        child: Text(isOfferingRide? 'Find Ride': 'Offer Ride'))],
        ),
      ),
    );
  }

}
