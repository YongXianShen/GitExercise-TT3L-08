import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'package:mmusuperapp/carpool.dart';
import 'package:mmusuperapp/food.dart';
import 'package:mmusuperapp/hostelfinder.dart';

class FeaturesCards extends StatelessWidget {
  const FeaturesCards({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Welcome',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CarpoolDetails()),
                  );
                },
                child: const Card(
                  child: _FeaturesCard(cardName: 'Carpool'),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FoodDetails()),
                  );
                },
                child: Card(
                  child: _FeaturesCard(cardName: 'Food Delivery'),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HostelFinderDetails()),
                  );
                },
                child: Card(
                  child: _FeaturesCard(cardName: 'Roommate Finder'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FeaturesCard extends StatelessWidget {
  const _FeaturesCard({required this.cardName});
  final String cardName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 200,
      child: Center(child: Text(cardName)),
    );
  }
}
