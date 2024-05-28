import 'dart:js';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'package:mmusuperapp/carpool.dart';
import 'package:mmusuperapp/food/components/my_drawer.dart';
import 'package:mmusuperapp/food/pages/home_page.dart';
import 'package:mmusuperapp/hostelfinder.dart';

import 'profile_page.dart';


class FeaturesCards extends StatelessWidget {
  const FeaturesCards({super.key});

  void goToProfilePage() {
    Navigator.pop(context as BuildContext);
    Navigator.push(
      context as BuildContext, 
      MaterialPageRoute(
        builder: (context) => const ProfilePage(),
      ),
    );
  }

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
        drawer: MyDrawer(
          onProfileTap: goToProfilePage,
          onSignOut: signOut,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CarpoolDetails()),
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
                    MaterialPageRoute(builder: (context) => HomePage()),
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
                    MaterialPageRoute(builder: (context) => HostelFinderDetails()),
                  );
                },
                child: const Card(
                  color: Colors.blueAccent,
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
      height: 170,
      child: Center(child: Text(cardName)),
    );
  }
}
