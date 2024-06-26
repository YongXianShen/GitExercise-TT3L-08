import 'package:flutter/material.dart';
import 'package:mmusuperapp/carpool/carpool.dart';
import 'package:mmusuperapp/carpool/rider_page.dart';
import 'package:mmusuperapp/pages/driver_details.dart';
import 'package:mmusuperapp/pages/rider_details.dart';

void main() {
  runApp(const OptionScreenApp());
}

class OptionScreenApp extends StatelessWidget {
  const OptionScreenApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: OptionScreen(),
    );
  }
}

class OptionScreen extends StatelessWidget {
  const OptionScreen({Key? key}) : super(key: key);

  void _navigateToPage(BuildContext context, String option) {
    if (option == 'Rider') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => RiderPage()),
      );
    } else if (option == 'Driver') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CarpoolDetails()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(bottom: 40.0),
              child: Text(
                'User or Driver',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            GestureDetector(
              onTap: () => _navigateToPage(context, 'Rider'),
              child: SizedBox(
                width: 390,
                height: 200,
                child: Card(
                  color: Colors.blueAccent,
                  child: Center(
                    child: const Text(
                      'I am a Rider',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () => _navigateToPage(context, 'Driver'),
              child: SizedBox(
                width: 390,
                height: 200,
                child: Card(
                  color: Colors.lightBlueAccent,
                  child: Center(
                    child: const Text(
                      'I am a Driver',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



