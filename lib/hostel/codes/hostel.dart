import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mmusuperapp/hostel/codes/hostel_room.dart';

class Hostel extends StatelessWidget {
  const Hostel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[100],
      appBar: AppBar(
        title: const Text(
          "Finding Your Roommate!",
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
            const SizedBox(height: 20.0),
            const Stack(
              children: [
                Card(
                  elevation: 10.0,
                  color: Color.fromARGB(255, 26, 35, 126),
                  child: SizedBox(
                    height: 150,
                    width: 400,
                    child: Center()
                  ),
                ),
                Card(
                  elevation: 10.0,
                  color: Color.fromARGB(255, 159, 168, 218),
                  child: SizedBox(
                    height: 140,
                    width: 390,
                    child: Center(
                      child: Text(
                        "Find your roommates whom you find suitable, comfortable and peaceful to live with!",
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold
                        ),
                        textAlign: TextAlign.center,
                      )
                    )
                  ),
                )
              ],
            ),
            const SizedBox(height: 40.0),
            Stack(
              children: [
                const Card(
                  elevation: 10.0,
                  color: Color.fromARGB(255, 26, 35, 126),
                  child: SizedBox(
                    height: 450,
                    width: 400,
                    child: Center()
                  ),
                ),
                Card(
                  elevation: 10.0,
                  color: const Color.fromARGB(255, 159, 168, 218),
                  child: SizedBox(
                    height: 440,
                    width: 390,
                    child: Column(
                      children: [
                        const SizedBox(height: 20.0),
                        Card(
                          elevation: 10.0,
                          color: Colors.indigo[900],
                          child: const SizedBox(
                            height: 50,
                            width: 220,
                            child: Center(
                              child: Text(
                                "Map Of Hostel",
                                style: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        SizedBox(
                          height: 300.0,
                          width: 350.0,
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  image: const DecorationImage(
                                    image: AssetImage("lib/hostel/images/hostel_map.jpg"),
                                    fit: BoxFit.fill
                                  ),
                                  borderRadius: BorderRadius.circular(10.0),
                                )
                              )
                            ]
                          ),
                        ),
                      ]
                    ),
                  )
                ),
              ],
            ),
            const SizedBox(height: 40.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HostelRoom()),
                    );
                  },
                  child: Card(
                    elevation: 10.0,
                    color: Colors.indigo[900],
                    child: const SizedBox(
                      height: 50,
                      width: 250,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                          SizedBox(width: 10.0),
                          Text(
                            "Lets get started!",
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                            ),
                            textAlign: TextAlign.center,
                          )
                        ]
                      )
                    ),
                  ),
                )
              ],
            )
          ]
        )
      )
    );
  }
}