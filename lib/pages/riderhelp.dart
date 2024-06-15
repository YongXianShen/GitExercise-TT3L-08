import 'package:flutter/material.dart';

class RiderHelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rider Help Page'),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Image.asset(
          'assets/images/riderhelp.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
