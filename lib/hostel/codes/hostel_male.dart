import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mmusuperapp/hostel/codes/swipe_state.dart';
import 'package:mmusuperapp/hostel/codes/hostel_male_user.dart';

class HostelMale extends StatelessWidget {
  const HostelMale({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56.0),
        child: AppBar(
          title: const Row(
            children: [
              Icon(
                Icons.hotel,
                color: Colors.white,
              ),
              SizedBox(width: 20.0),
              Text(
                "DISCOVER",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
              )
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.message
              ),
              color: Colors.white,
              onPressed: () {}
            ),
            IconButton(
              icon: const Icon(
                Icons.person
              ),
              color: Colors.white,
              onPressed: () {},
            )
          ],
          backgroundColor: Colors.indigo[900],
        )
      ),
      body: BlocBuilder<SwipeBloc, SwipeState>(
        builder: (context, state) {
          if (state is SwipeLoading) {
            return const Center(
              child: CircularProgressIndicator()
            );
          }
          else if (state is SwipeLoaded) {
            return Column(
              children: [
                Draggable(
                  feedback: UserCard(user: state.users[0]),
                  childWhenDragging:  UserCard(user: state.users[1]),
                  onDragEnd: (drag) {
                    if (drag.velocity.pixelsPerSecond.dx < 0) {
                      context.read<SwipeBloc>().add(
                        SwipeLeft(user: state.users[0])
                      );
                      ("Swipe left!");
                    }
                    else {
                      context.read<SwipeBloc>().add(
                        SwipeRight(user: state.users[0])
                      );
                      ("Swipe right!");
                    }
                  },
                  child: UserCard(user: state.users[0]),
                ),
                const SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 60.0
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          context.read<SwipeBloc>().add(
                            SwipeLeft(user: state.users[0])
                          );
                          ("Swipe left!");
                        },
                        child: const ChoiceButton(
                          width: 60,
                          height: 60,
                          size: 25,
                          color: Colors.black,
                          hasGradient: false,
                          icon: Icons.cabin_rounded
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          context.read<SwipeBloc>().add(
                            SwipeRight(user: state.users[0])
                          );
                          ("Swipe right!");
                        },
                        child: const ChoiceButton(
                          width: 80,
                          height: 80,
                          size: 30,
                          color: Colors.white,
                          hasGradient: true,
                          icon: Icons.favorite
                        ),
                      ),
                      const ChoiceButton(
                        width: 60,
                        height: 60,
                        size: 25,
                        color: Colors.black,
                        hasGradient: false,
                        icon: Icons.watch_later
                      ),
                    ]
                  ),
                )
              ]
            );
          }
          else {
            return const Text("Something went wrong...  :(");
          }
        }
      )
    );
  }
}

class UserCard extends StatelessWidget {
  final User user;

  const UserCard({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        left: 20,
        right: 20
      ),
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 1.4,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(user.imageUrls[0])
                ),
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 4.0,
                    blurRadius: 4.0,
                    offset: const Offset(3, 3),
                  )
                ]
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                gradient: const LinearGradient(
                  colors: [
                    Color.fromARGB(200, 0, 0, 0),
                    Color.fromARGB(0, 0, 0, 0)
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter
                )
              ),
            ),
            Positioned(
              bottom: 30.0,
              left: 20.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${user.name}, ${user.age}",
                    style: const TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    )
                  ),
                  Text(
                    user.jobTitle,
                    style: const TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.normal,
                      color: Colors.white
                    )
                  ),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                          top: 8.0,
                          right: 8.0,
                        ),
                        height: 60.0,
                        width: 60.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(user.imageUrls[1]),
                            fit: BoxFit.cover
                          ),
                          borderRadius: BorderRadius.circular(5.0)
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          top: 8.0,
                          right: 8.0,
                        ),
                        height: 60.0,
                        width: 60.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(user.imageUrls[2]),
                            fit: BoxFit.cover
                          ),
                          borderRadius: BorderRadius.circular(5.0)
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          top: 8.0,
                          right: 8.0,
                        ),
                        height: 60.0,
                        width: 60.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(user.imageUrls[3]),
                            fit: BoxFit.cover
                          ),
                          borderRadius: BorderRadius.circular(5.0)
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          top: 8.0,
                          right: 8.0,
                        ),
                        height: 60.0,
                        width: 60.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(user.imageUrls[4]),
                            fit: BoxFit.cover
                          ),
                          borderRadius: BorderRadius.circular(5.0)
                        ),
                      ),
                      const SizedBox(width: 20.0),
                      Container(
                        width: 35.0,
                        height: 35.0,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white
                        ),
                        child: Icon(
                          Icons.info_outline,
                          color: Theme.of(context).primaryColor
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        )
      ),
    );
  }
}

class ChoiceButton extends StatelessWidget {
  final double width;
  final double height;
  final double size;
  final Color color;
  final bool hasGradient;
  final IconData icon;

  const ChoiceButton({
    required this.width,
    required this.height,
    required this.size,
    required this.color,
    required this.hasGradient,
    required this.icon,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        gradient: hasGradient
        ? const LinearGradient(
          colors: [
            Color.fromARGB(255, 26, 35, 126),
            Color.fromARGB(255, 63, 81, 181)
          ]
        )
        : const LinearGradient(
          colors: [
            Color.fromARGB(255, 92, 107, 192),
            Color.fromARGB(255, 159, 168, 218)
          ]
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha(50),
            spreadRadius: 4.0,
            blurRadius: 4.0,
            offset: const Offset(3, 3)
          )
        ]
      ),
      child: Icon(
        icon,
        color: color
      ),
    );
  }
}