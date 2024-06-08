import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'package:mmusuperapp/carpool/user_or_driver.dart';
import 'package:mmusuperapp/food/pages/home_page.dart';
import 'package:mmusuperapp/hostel/codes/hostel.dart';


class FeaturesCards extends StatelessWidget {
  const FeaturesCards({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Welcome back to MMU!',
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
                    MaterialPageRoute(builder: (context) => OptionScreen()),
                  );
                },
                child: const Card(
                  color: Colors.lightBlueAccent,
                  child: _FeaturesCard(cardName: 'Carpool'),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
                child: const Card(
                  color: Colors.lightBlue,
                  child: _FeaturesCard(cardName: 'Food Delivery'),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Hostel()),
                  );
                },
                child: const Card(
                  color: Colors.blueAccent,
                  child: _FeaturesCard(cardName: 'Hostel Application'),
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
      height: 170,
      child: Center(child: Text(cardName)),
    );
  }
}
