import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mmusuperapp/roommates/hostel_hb1.dart';
import 'package:mmusuperapp/roommates/hostel_hb2.dart';
import 'package:mmusuperapp/roommates/hostel_hb3.dart';
import 'package:mmusuperapp/roommates/hostel_hb4.dart';

class Hostel1 extends StatelessWidget {
  const Hostel1({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      theme: CupertinoThemeData(brightness: Brightness.light),
      home: Hostel11(),
    );
  }
}

class Hostel11 extends StatelessWidget {
  const Hostel11({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Welcome To Roommate Finder!'),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            CupertinoButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HostelHB1()),
                  );
              },
              child: const Text('H B 1'),
            ),
            const SizedBox(height: 30),
            CupertinoButton.filled(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HostelHB2()),
                  );
              },
              child: const Text('H B 2'),
            ),
            const SizedBox(height: 30),
            CupertinoButton.filled(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HostelHB3()),
                  );
              },
              child: const Text('H B 3'),
            ),
            const SizedBox(height: 30),
            CupertinoButton.filled(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HostelHB4()),
                  );
              },
              child: const Text('H B 4'),
            ),
          ],
        ),
      ),
    );
  }
}