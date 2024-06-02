import 'package:flutter/material.dart';
import 'package:mmusuperapp/roommates/hostel.dart';

class HB1A extends StatelessWidget {
  const HB1A({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "H B 1",
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
                  MaterialPageRoute(builder: (context) => const Hostel()),
                );
              },
              child: const Card(
                color: Colors.lightBlueAccent,
                child: _HB1ACard(cardName: 'Block A'),
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
                color: Colors.lightBlue,
                child: _HB1ACard(cardName: 'Block B'),
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
                child: _HB1ACard(cardName: 'Block C'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HB1ACard extends StatelessWidget {
  const _HB1ACard({required this.cardName});
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