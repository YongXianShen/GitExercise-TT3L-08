import 'package:flutter/material.dart';
import 'package:mmusuperapp/roommates/hb1.dart';
import 'package:mmusuperapp/roommates/hb2.dart';
import 'package:mmusuperapp/roommates/hb3.dart';
import 'package:mmusuperapp/roommates/hb4.dart';

class Hostel extends StatelessWidget {
  const Hostel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Welcome To Roommate Finder!",
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
                  MaterialPageRoute(builder: (context) => const HB1()),
                );
              },
              child: const Card(
                color: Colors.lightBlueAccent,
                child: _HostelCard(cardName: 'HB1'),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HB2()),
                );
              },
              child: const Card(
                color: Colors.lightBlue,
                child: _HostelCard(cardName: 'HB2'),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HB3()),
                );
              },
              child: const Card(
                color: Colors.blueAccent,
                child: _HostelCard(cardName: 'HB3'),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HB4()),
                );
              },
              child: const Card(
                color: Colors.blueAccent,
                child: _HostelCard(cardName: 'HB4'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HostelCard extends StatelessWidget {
  const _HostelCard({required this.cardName});
  final String cardName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 100,
      child: Center(child: Text(cardName)),
    );
  }
}
