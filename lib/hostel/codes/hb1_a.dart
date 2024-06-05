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

  List<SizedBox> floor = [
    const SizedBox(
      width: double.infinity,
      height: 550,
      child: HB1AFloor()
    ),
    const SizedBox(
      width: double.infinity,
      height: 550,
      child: HB1AFloor()
    ),
    const SizedBox(
      width: double.infinity,
      height: 550,
      child: HB1AFloor()
    ),
    const SizedBox(
      width: double.infinity,
      height: 550,
      child: HB1AFloor()
    ),
    const SizedBox(
      width: double.infinity,
      height: 550,
      child: HB1AFloor()
    )
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
        backgroundColor: Colors.orange[800],
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
                  const SizedBox(height: 10.0),
                  SizedBox(
                    width: double.infinity,
                    height: 550.0,
                    child: floor[current]
                  )
                ],
              )
            )
          ],
        )
      )
    );
  }
}

class HB1AFloor extends StatefulWidget {
  const HB1AFloor({super.key});

  @override
  State<HB1AFloor> createState() => _HB1AFloorState();
}

class _HB1AFloorState extends State<HB1AFloor> {

  int index = 1;

  List<int> rooms = [
    01,
    02,
    03,
    04,
    05,
    06,
    07,
    08,
    09,
    10,
    11,
    12,
    13,
    14,
    15,
    16,
    17
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 550,
      child: ListView.builder(
        physics:  const BouncingScrollPhysics(),
        itemCount: rooms.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (_, index) {
          return ListTile(
            title: Text("Room $index"),
            subtitle: const Text("Available now"),
            leading: const Icon(Icons.people),
            trailing: IconButton(
              icon: const Icon(Icons.arrow_forward),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => SimpleDialog(
                    title: const Text("Apply here?"),
                    contentPadding: const EdgeInsets.all(20.0),
                    children: [
                      const Text(
                        "Press 'Yes' to cofirm your decision"
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text("Yes"),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text("No"),
                      )
                    ],
                  )
                );
              },
            )
          );
        }
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