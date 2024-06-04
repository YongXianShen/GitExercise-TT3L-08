import 'package:flutter/material.dart';

class HB1A extends StatefulWidget {
  const HB1A({super.key});

  @override
  State<HB1A> createState() => _HB1AState();
}

class _HB1AState extends State<HB1A> {

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

  List<String> rooms = [
    "Room 001",
    "Room 002",
    "Room 003",
    "Room 004",
    "Room 005",
    "Room 006",
    "Room 007",
    "Room 008",
    "Room 009",
    "Room 010",
    "Room 011",
    "Room 012",
    "Room 013",
    "Room 014",
    "Room 015",
    "Room 016"
  ];

  int current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[100],
      appBar: AppBar(
        title: const Text(
          "HB1 Block B",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
        ),
        backgroundColor: Colors.orange[600],
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
                              color: const Color.fromARGB(255, 239, 108, 0),
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
                            color: Color.fromARGB(255, 239, 108, 0)
                          ),
                        )
                      )
                    ]
                  );
                }
              )
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              width: double.infinity,
              child: Column(
                children: [
                  Icon(
                    icons[current],
                    size: 150.0,
                    color: Colors.orange[800]
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    items[current],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                      color: Color.fromARGB(255, 239, 108, 0)
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 500.0,
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: 18,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: const Card(
                                color: Color.fromARGB(255, 239, 108, 0),
                                child: _HB1ACard(cardName: "Room 001")
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: const Card(
                                color: Color.fromARGB(255, 239, 108, 0),
                                child: _HB1ACard(cardName: "Room 002")
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: const Card(
                                color: Color.fromARGB(255, 239, 108, 0),
                                child: _HB1ACard(cardName: "Room 003")
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: const Card(
                                color: Color.fromARGB(255, 239, 108, 0),
                                child: _HB1ACard(cardName: "Room 004")
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: const Card(
                                color: Color.fromARGB(255, 239, 108, 0),
                                child: _HB1ACard(cardName: "Room 005")
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: const Card(
                                color: Color.fromARGB(255, 239, 108, 0),
                                child: _HB1ACard(cardName: "Room 006")
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: const Card(
                                color: Color.fromARGB(255, 239, 108, 0),
                                child: _HB1ACard(cardName: "Room 007")
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: const Card(
                                color: Color.fromARGB(255, 239, 108, 0),
                                child: _HB1ACard(cardName: "Room 008")
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: const Card(
                                color: Color.fromARGB(255, 239, 108, 0),
                                child: _HB1ACard(cardName: "Room 009")
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: const Card(
                                color: Color.fromARGB(255, 239, 108, 0),
                                child: _HB1ACard(cardName: "Room 010")
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: const Card(
                                color: Color.fromARGB(255, 239, 108, 0),
                                child: _HB1ACard(cardName: "Room 011")
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: const Card(
                                color: Color.fromARGB(255, 239, 108, 0),
                                child: _HB1ACard(cardName: "Room 012")
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: const Card(
                                color: Color.fromARGB(255, 239, 108, 0),
                                child: _HB1ACard(cardName: "Room 013")
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: const Card(
                                color: Color.fromARGB(255, 239, 108, 0),
                                child: _HB1ACard(cardName: "Room 014")
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: const Card(
                                color: Color.fromARGB(255, 239, 108, 0),
                                child: _HB1ACard(cardName: "Room 015")
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: const Card(
                                color: Color.fromARGB(255, 239, 108, 0),
                                child: _HB1ACard(cardName: "Room 016")
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: const Card(
                                color: Color.fromARGB(255, 239, 108, 0),
                                child: _HB1ACard(cardName: "Room 017")
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: const Card(
                                color: Color.fromARGB(255, 239, 108, 0),
                                child: _HB1ACard(cardName: "Room 018")
                              ),
                            )
                          ],
                        );
                      }
                    )
                  ),
                ]
              )
            ),
          ]
        )
      )
    );
  }
}

class _HB1ACard extends StatelessWidget {
  const _HB1ACard({required this.cardName});
  final String cardName;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 100,
      child: Center(
        child: Text(
          cardName,
          style: const TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
        ),
      ),
    );
  }
}