import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mmusuperapp/hostel/codes/hostel_female.dart';
import 'package:mmusuperapp/hostel/codes/hostel_male.dart';

class Hostel extends StatefulWidget {
  const Hostel({super.key});

  @override
  State<Hostel> createState() => _HostelState();
}

class _HostelState extends State<Hostel> {
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
              alignment: Alignment.center,
              children: [
                const Card(
                  elevation: 10.0,
                  color: Color.fromARGB(255, 26, 35, 126),
                  child: SizedBox(
                    height: 400,
                    width: 400,
                    child: Center()
                  ),
                ),
                const Card(
                  elevation: 10.0,
                  color: Color.fromARGB(255, 159, 168, 218),
                  child: SizedBox(
                    height: 380,
                    width: 380,
                  ),
                ),
                Column(
                  children: [
                    const Card(
                      elevation: 10.0,
                      color: Color.fromARGB(255, 121, 134, 203),
                      child: SizedBox(
                        height: 50,
                        width: 250,
                        child: Center(
                          child: Text(
                            "Select Your Gender:",
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold
                            ),
                            textAlign: TextAlign.center,
                          )
                        )
                      ),
                    ),
                    const SizedBox(height: 60),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const HostelMale())
                        );
                      },
                      child: const Card(
                        elevation: 10.0,
                        color: Color.fromARGB(255, 121, 134, 203),
                        child: SizedBox(
                          height: 50,
                          width: 120,
                          child: Center(
                            child: Text(
                              "Male",
                              style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold
                              ),
                              textAlign: TextAlign.center,
                            )
                          )
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const HostelFemale(),)
                        );
                      },
                      child: const Card(
                        elevation: 10.0,
                        color: Color.fromARGB(255, 121, 134, 203),
                        child: SizedBox(
                          height: 50,
                          width: 120,
                          child: Center(
                            child: Text(
                              "Female",
                              style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold
                              ),
                              textAlign: TextAlign.center,
                            )
                          )
                        ),
                      ),
                    ),
                  ]
                )
              ],
            ),
            const SizedBox(height: 40.0),
            Stack(
              alignment: Alignment.center,
              children: [
                Card(
                  elevation: 10.0,
                  color: Colors.orange[800],
                  child: const SizedBox(
                    height: 650,
                    width: 400,
                    child: Center()
                  ),
                ),
                Card(
                  elevation: 10.0,
                  color: Colors.orange[200],
                  child: const SizedBox(
                    height: 630,
                    width: 380,
                    child: Center()
                  ),
                ),
                Column(
                  children: [
                    Card(
                      elevation: 10.0,
                      color: Colors.orange[800],
                      child: const SizedBox(
                        height: 50,
                        width: 120,
                        child: Center(
                          child: Text(
                            "HB1",
                            style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    SizedBox(
                      height: 250.0,
                      width: 350.0,
                      child: Card(
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                  image: AssetImage("lib/hostel/images/hb1.jpg"),
                                  fit: BoxFit.fill
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              )
                            ),
                            Container(
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    Color.fromARGB(150, 0, 0, 0),
                                    Colors.transparent
                                  ],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            )
                          ]
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Card(
                          elevation: 10.0,
                          color: Colors.orange[800],
                          child: const SizedBox(
                            height: 220,
                            width: 350,
                            child: Center()
                          ),
                        ),
                        const SizedBox(
                          height: 200,
                          width: 320,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Gender: ",
                                    style: TextStyle(
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  Card(
                                    elevation: 10.0,
                                    color: Color.fromARGB(255, 150, 50, 0),
                                    child: SizedBox(
                                      height: 50.0,
                                      width: 120.0,
                                      child: Center(
                                        child: Text(
                                          "Male",
                                          style: TextStyle(
                                            fontSize: 30.0,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white
                                          ),
                                        )
                                      ),
                                    ),
                                  )
                                ]
                              ),
                              Text(
                                "List of blocks:",
                                style: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              Row(
                                children: [
                                  Card(
                                    elevation: 10.0,
                                    color: Color.fromARGB(255, 150, 50, 0),
                                    child: SizedBox(
                                      height: 50.0,
                                      width: 90.0,
                                      child: Center(
                                        child: Text(
                                          "Block A",
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white
                                          ),
                                        )
                                      ),
                                    ),
                                  ),
                                  Card(
                                    elevation: 10.0,
                                    color: Color.fromARGB(255, 150, 50, 0),
                                    child: SizedBox(
                                      height: 50.0,
                                      width: 90.0,
                                      child: Center(
                                        child: Text(
                                          "Block B",
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white
                                          ),
                                        )
                                      ),
                                    ),
                                  ),
                                  Card(
                                    elevation: 10.0,
                                    color: Color.fromARGB(255, 150, 50, 0),
                                    child: SizedBox(
                                      height: 50.0,
                                      width: 90.0,
                                      child: Center(
                                        child: Text(
                                          "Block C",
                                          style: TextStyle(
                                            fontSize: 20.0,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white
                                          ),
                                        )
                                      ),
                                    ),
                                  )
                                ]
                              ),
                            ],
                          ),
                        ),
                      ]
                    )
                  ]
                ),
              ],
            ),
            const SizedBox(height: 80.0),
            Stack(
              children: [
                Card(
                  color: Colors.blue[200],
                  elevation: 10.0,
                  child: Opacity(
                    opacity: 0.5,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        "lib/hostel/images/hb2.jpg",
                        height: 250,
                        width: 400,
                        fit: BoxFit.fill, 
                      ),
                    ),
                  )
                ),
                const SizedBox(
                  height: 250,
                  width: 400,
                  child: Center(
                    child: Text(
                      "HB2",
                      style: TextStyle(
                        fontSize: 100.0,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  )
                )
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  child: Card(
                    elevation: 10.0,
                    color: Color.fromARGB(255, 13, 71, 161),
                    child: _HostelCard(cardName: 'A'),
                  ),
                ),
                SizedBox(width: 10.0),
                InkWell(
                  child: Card(
                    elevation: 10.0,
                    color: Color.fromARGB(255, 21, 101, 192),
                    child: _HostelCard(cardName: 'B'),
                  ),
                ),
                SizedBox(width: 10.0),
                InkWell(
                  child: Card(
                    elevation: 10.0,
                    color: Color.fromARGB(255, 25, 118, 210),
                    child: _HostelCard(cardName: 'C'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 80.0),
            Stack(
              children: [
                Card(
                  color: Colors.red[200],
                  elevation: 10.0,
                  child: Opacity(
                    opacity: 0.5,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        "lib/hostel/images/hb3.jpg",
                        height: 250,
                        width: 400,
                        fit: BoxFit.fill, 
                      ),
                    ),
                  )
                ),
                const SizedBox(
                  height: 250,
                  width: 400,
                  child: Center(
                    child: Text(
                      "HB3",
                      style: TextStyle(
                        fontSize: 100.0,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  )
                )
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  child: Card(
                    elevation: 10.0,
                    color: Color.fromARGB(255, 183, 28, 28),
                    child: _HostelCard(cardName: 'A'),
                  ),
                ),
                SizedBox(width: 10.0),
                InkWell(
                  child: Card(
                    elevation: 10.0,
                    color: Color.fromARGB(255, 211, 47, 47),
                    child: _HostelCard(cardName: 'B'),
                  ),
                ),
                SizedBox(width: 10.0),
                InkWell(
                  child: Card(
                    elevation: 10.0,
                    color: Color.fromARGB(255, 244, 67, 54),
                    child: _HostelCard(cardName: 'C'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 80.0),
            Stack(
              children: [
                Card(
                  color: Colors.purple[200],
                  elevation: 10.0,
                  child: Opacity(
                    opacity: 0.5,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        "lib/hostel/images/hb4.jpg",
                        height: 250,
                        width: 400,
                        fit: BoxFit.fill, 
                      ),
                    ),
                  )
                ),
                const SizedBox(
                  height: 250,
                  width: 400,
                  child: Center(
                    child: Text(
                      "HB4",
                      style: TextStyle(
                        fontSize: 100.0,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  )
                )
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  child: Card(
                    elevation: 10.0,
                    color: Color.fromARGB(255, 74, 20, 140),
                    child: _HostelCard(cardName: 'A'),
                  ),
                ),
                SizedBox(width: 10.0),
                InkWell(
                  child: Card(
                    elevation: 10.0,
                    color: Color.fromARGB(255, 106, 27, 154),
                    child: _HostelCard(cardName: 'B'),
                  ),
                ),
                SizedBox(width: 10.0),
                InkWell(
                  child: Card(
                    elevation: 10.0,
                    color: Color.fromARGB(255, 123, 31, 162),
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
