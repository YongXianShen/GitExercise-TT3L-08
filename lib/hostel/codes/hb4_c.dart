import 'package:flutter/material.dart';

class HB4C extends StatefulWidget {
  const HB4C({super.key});

  @override
  State<HB4C> createState() => _HB4CState();
}

class _HB4CState extends State<HB4C> {

  List<String> items = [
    "Floor G",
    "Floor 1",
    "Floor 2",
    "Floor 3",
    "Floor 4"
  ];

  List<IconData> icons = [
    Icons.person,
    Icons.person,
    Icons.person,
    Icons.person,
    Icons.person
  ];

  int current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      appBar: AppBar(
        title: const Text(
          "HB4 Block C",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
        ),
        backgroundColor: Colors.purple[700],
      ),
      body: Container(
        margin: const EdgeInsets.all(5.0),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: 60,
              width: double.infinity,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: items.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            current = index;
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.all(5.0),
                          width: 80,
                          height: 45,
                          decoration: BoxDecoration(
                            color: current == index
                            ? Colors.white70
                            : Colors.white54,
                            borderRadius: current == index
                            ? BorderRadius.circular(15.0)
                            : BorderRadius.circular(10.0),
                            border: current == index
                            ? Border.all(
                              color: const Color.fromARGB(255, 123, 31, 162),
                              width: 2.0
                            )
                            : null
                          ),
                          child: Center(
                            child: Text(
                              items[index],
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: current == index
                                ? Colors.black
                                : Colors.grey
                              )
                            )
                          )
                        )
                      ),
                      Visibility(
                        visible: current == index,
                        child: Container(
                          width: 5.0,
                          height: 5.0,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromARGB(255, 123, 31, 162)
                          ),
                        )
                      )
                    ]
                  );
                }
              )
            ),
            Container(
              margin: const EdgeInsets.only(top: 30.0),
              width: double.infinity,
              height: 500.0,
              child: Column(
                children: [
                  Icon(
                    icons[current],
                    size: 200.0,
                    color: Colors.purple[700]
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    items[current],
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 30.0,
                      color: Color.fromARGB(255, 123, 31, 162)
                    ),
                  )
                ]
              )
            )
          ]
        )
      )
    );
  }
}