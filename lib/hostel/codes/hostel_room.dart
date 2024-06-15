import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mmusuperapp/hostel/codes/hostel_gender.dart';

class HostelRoom extends StatefulWidget {
  const HostelRoom({super.key});

  @override
  State<HostelRoom> createState() => _HostelRoomState();
}

class _HostelRoomState extends State<HostelRoom> {
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
                    height: 120,
                    width: 400,
                    child: Center()
                  ),
                ),
                Card(
                  elevation: 10.0,
                  color: Color.fromARGB(255, 159, 168, 218),
                  child: SizedBox(
                    height: 110,
                    width: 390,
                    child: Center(
                      child: Text(
                        "These are the hostels that you can stay within this university!",
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
                        elevation: 10.0,
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
                              SizedBox(height: 20.0),
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
                                      width: 95.0,
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
                                      width: 95.0,
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
                                      width: 95.0,
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
            const SizedBox(height: 40.0),
            Stack(
              alignment: Alignment.center,
              children: [
                Card(
                  elevation: 10.0,
                  color: Colors.blue[900],
                  child: const SizedBox(
                    height: 650,
                    width: 400,
                    child: Center()
                  ),
                ),
                Card(
                  color: Colors.blue[200],
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
                      color: Colors.blue[900],
                      child: const SizedBox(
                        height: 50,
                        width: 120,
                        child: Center(
                          child: Text(
                            "HB2",
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
                        elevation: 10.0,
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                  image: AssetImage("lib/hostel/images/hb2.jpg"),
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
                          color: Colors.blue[900],
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
                                    color: Color.fromARGB(255, 0, 30, 70),
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
                              SizedBox(height: 20.0),
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
                                    color: Color.fromARGB(255, 0, 30, 70),
                                    child: SizedBox(
                                      height: 50.0,
                                      width: 95.0,
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
                                    color: Color.fromARGB(255, 0, 30, 70),
                                    child: SizedBox(
                                      height: 50.0,
                                      width: 95.0,
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
                                    color: Color.fromARGB(255, 0, 30, 70),
                                    child: SizedBox(
                                      height: 50.0,
                                      width: 95.0,
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
            const SizedBox(height: 40.0),
            Stack(
              alignment: Alignment.center,
              children: [
                Card(
                  elevation: 10.0,
                  color: Colors.red[900],
                  child: const SizedBox(
                    height: 650,
                    width: 400,
                    child: Center()
                  ),
                ),
                Card(
                  color: Colors.red[200],
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
                      color: Colors.red[900],
                      child: const SizedBox(
                        height: 50,
                        width: 120,
                        child: Center(
                          child: Text(
                            "HB3",
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
                        elevation: 10.0,
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                  image: AssetImage("lib/hostel/images/hb3.jpg"),
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
                          color: Colors.red[900],
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
                                    color: Color.fromARGB(255, 80, 0, 0),
                                    child: SizedBox(
                                      height: 50.0,
                                      width: 130.0,
                                      child: Center(
                                        child: Text(
                                          "Female",
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
                              SizedBox(height: 20.0),
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
                                    color: Color.fromARGB(255, 80, 0, 0),
                                    child: SizedBox(
                                      height: 50.0,
                                      width: 95.0,
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
                                    color: Color.fromARGB(255, 80, 0, 0),
                                    child: SizedBox(
                                      height: 50.0,
                                      width: 95.0,
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
                                    color: Color.fromARGB(255, 80, 0, 0),
                                    child: SizedBox(
                                      height: 50.0,
                                      width: 95.0,
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
            const SizedBox(height: 40.0),
            Stack(
              alignment: Alignment.center,
              children: [
                Card(
                  elevation: 10.0,
                  color: Colors.purple[900],
                  child: const SizedBox(
                    height: 650,
                    width: 400,
                    child: Center()
                  ),
                ),
                Card(
                  color: Colors.purple[200],
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
                      color: Colors.purple[900],
                      child: const SizedBox(
                        height: 50,
                        width: 120,
                        child: Center(
                          child: Text(
                            "HB4",
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
                        elevation: 10.0,
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                  image: AssetImage("lib/hostel/images/hb4.jpg"),
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
                          color: Colors.purple[900],
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
                                    color: Color.fromARGB(255, 30, 0, 70),
                                    child: SizedBox(
                                      height: 50.0,
                                      width: 130.0,
                                      child: Center(
                                        child: Text(
                                          "Female",
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
                              SizedBox(height: 20.0),
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
                                    color: Color.fromARGB(255, 30, 0, 70),
                                    child: SizedBox(
                                      height: 50.0,
                                      width: 95.0,
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
                                    color: Color.fromARGB(255, 30, 0, 70),
                                    child: SizedBox(
                                      height: 50.0,
                                      width: 95.0,
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
                                    color: Color.fromARGB(255, 30, 0, 70),
                                    child: SizedBox(
                                      height: 50.0,
                                      width: 95.0,
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
            const SizedBox(height: 40.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Card(
                    elevation: 10.0,
                    color: Colors.indigo[900],
                    child: const SizedBox(
                      height: 50,
                      width: 120,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Back",
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(width: 10.0),
                          Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          )
                        ]
                      )
                    ),
                  ),
                ),
                const SizedBox(width: 100.0),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HostelGender()),
                    );
                  },
                  child: Card(
                    elevation: 10.0,
                    color: Colors.indigo[900],
                    child: const SizedBox(
                      height: 50,
                      width: 120,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                          SizedBox(width: 10.0),
                          Text(
                            "Next",
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
          ],
        ),
      ),
    );
  }
}