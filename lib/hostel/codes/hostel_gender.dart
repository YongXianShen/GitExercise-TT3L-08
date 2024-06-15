import 'package:flutter/material.dart';
import 'package:mmusuperapp/hostel/codes/hostel_male.dart';

class HostelGender extends StatelessWidget {
  const HostelGender({super.key});

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
                        "Now, please choose your ideal roommate to live with!",
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
                          MaterialPageRoute(builder: (context) => const HostelMale(),)
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
          ]
        )
      )
    );
  }
}