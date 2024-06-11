import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'user.dart';

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
      body: UserCard(user: User.users[0])
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