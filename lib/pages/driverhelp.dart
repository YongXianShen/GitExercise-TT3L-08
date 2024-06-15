import 'package:flutter/material.dart';

class DriverHelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Driver Help Page'),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Image.asset(
          'assets/images/driverhelp.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
