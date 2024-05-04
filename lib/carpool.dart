import 'package:flutter/material.dart';

class CarpoolPage extends StatelessWidget {
  const CarpoolPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Carpool',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blue,
        elevation: 0.0,
        centerTitle: true,
      ),
      
    );
  }
}