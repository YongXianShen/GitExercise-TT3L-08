import 'package:flutter/material.dart';
import 'package:mmusuperapp/hostel/hostel_codes/hb1_a.dart';
import 'package:mmusuperapp/hostel/hostel_codes/hb1_b.dart';
import 'package:mmusuperapp/hostel/hostel_codes/hb1_c.dart';
import 'package:mmusuperapp/hostel/hostel_codes/hb2_a.dart';
import 'package:mmusuperapp/hostel/hostel_codes/hb2_b.dart';
import 'package:mmusuperapp/hostel/hostel_codes/hb2_c.dart';
import 'package:mmusuperapp/hostel/hostel_codes/hb3_a.dart';
import 'package:mmusuperapp/hostel/hostel_codes/hb3_b.dart';
import 'package:mmusuperapp/hostel/hostel_codes/hb3_c.dart';
import 'package:mmusuperapp/hostel/hostel_codes/hb4_a.dart';
import 'package:mmusuperapp/hostel/hostel_codes/hb4_b.dart';
import 'package:mmusuperapp/hostel/hostel_codes/hb4_c.dart';

class Hostel extends StatefulWidget {
  const Hostel({super.key});

  @override
  State<Hostel> createState() => _HostelState();
}

class _HostelState extends State<Hostel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Hostel Application",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.indigo[900],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              "Find your roommates whom you find suitable, comfortable and peaceful to live with!",
              style: TextStyle(
                fontSize: 20.0
              ),
            ),
            const SizedBox(height: 10.0),
            const Text(
              "HB1",
              style: TextStyle(
                fontSize: 50.0,
                fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 10.0),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HB1A()),
                    );
                  },
                  child: const Card(
                    color: Color.fromARGB(255, 255, 183, 77),
                    child: _HostelCard(cardName: 'A'),
                  ),
                ),
                const SizedBox(width: 10.0,),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HB1B()),
                    );
                  },
                  child: const Card(
                    color: Color.fromARGB(255, 255, 183, 77),
                    child: _HostelCard(cardName: 'B'),
                  ),
                ),
                const SizedBox(width: 10.0,),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HB1C()),
                    );
                  },
                  child: const Card(
                    color: Color.fromARGB(255, 255, 183, 77),
                    child: _HostelCard(cardName: 'C'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            const Text(
              "HB2",
              style: TextStyle(
                fontSize: 50.0,
                fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 10.0),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HB2A()),
                    );
                  },
                  child: const Card(
                    color: Color.fromARGB(255, 25, 118, 210),
                    child: _HostelCard(cardName: 'A'),
                  ),
                ),
                const SizedBox(width: 10.0,),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HB2B()),
                    );
                  },
                  child: const Card(
                    color: Color.fromARGB(255, 25, 118, 210),
                    child: _HostelCard(cardName: 'B'),
                  ),
                ),
                const SizedBox(width: 10.0,),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HB2C()),
                    );
                  },
                  child: const Card(
                    color: Color.fromARGB(255, 25, 118, 210),
                    child: _HostelCard(cardName: 'C'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            const Text(
              "HB3",
              style: TextStyle(
                fontSize: 50.0,
                fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 10.0),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HB3A()),
                    );
                  },
                  child: const Card(
                    color: Color.fromARGB(255, 186, 104, 200),
                    child: _HostelCard(cardName: 'A'),
                  ),
                ),
                const SizedBox(width: 10.0,),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HB3B()),
                    );
                  },
                  child: const Card(
                    color: Color.fromARGB(255, 186, 104, 200),
                    child: _HostelCard(cardName: 'B'),
                  ),
                ),
                const SizedBox(width: 10.0,),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HB3C()),
                    );
                  },
                  child: const Card(
                    color: Color.fromARGB(255, 186, 104, 200),
                    child: _HostelCard(cardName: 'C'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            const Text(
              "HB4",
              style: TextStyle(
                fontSize: 50.0,
                fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 10.0),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HB4A()),
                    );
                  },
                  child: const Card(
                    color: Color.fromARGB(255, 229, 115, 115),
                    child: _HostelCard(cardName: 'A'),
                  ),
                ),
                const SizedBox(width: 10.0,),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HB4B()),
                    );
                  },
                  child: const Card(
                    color: Color.fromARGB(255, 229, 115, 115),
                    child: _HostelCard(cardName: 'B'),
                  ),
                ),
                const SizedBox(width: 10.0,),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HB4C()),
                    );
                  },
                  child: const Card(
                    color: Color.fromARGB(255, 229, 115, 115),
                    child: _HostelCard(cardName: 'C'),
                  ),
                ),
              ],
            )
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
      width: 120,
      height: 100,
      child: Center(
        child: Text(
          cardName,
          style: const TextStyle(
            fontSize: 50.0,
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
        ),
      ),
    );
  }
}
