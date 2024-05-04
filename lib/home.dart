import 'package:flutter/material.dart';


class FeaturesCards extends StatelessWidget {
  const FeaturesCards({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Features')),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Card(child: _FeaturesCard(cardName: 'Carpool')),
              Card(child: _FeaturesCard(cardName: 'Food Delivery')),
              Card(child: _FeaturesCard(cardName: 'Roomate Finder')),
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
      width: 300,
      height: 100,
      child: Center(child: Text(cardName)),
    );}}

