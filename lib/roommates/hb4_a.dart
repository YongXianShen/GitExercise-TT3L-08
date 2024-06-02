import 'package:flutter/material.dart';
import 'package:mmusuperapp/roommates/hostel.dart';

class HB4A extends StatelessWidget {
  const HB4A({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "H B 4",
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
                child: _HB4Card(cardName: 'Block A'),
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
                child: _HB4Card(cardName: 'Block B'),
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
                child: _HB4Card(cardName: 'Block C'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HB4Card extends StatelessWidget {
  const _HB4Card({required this.cardName});
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