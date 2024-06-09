import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "P R O F I L E",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
        ),
        backgroundColor: Colors.grey[400],
      ),
      body: Column(
        children: [
          Center(
            child: Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Card(
                  elevation: 10.0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      "lib/profile/images/man_smiling.jpg",
                      width: 390.0,
                      height: 390.0,
                      fit: BoxFit.fill,
                    ),
                  )
                ),
                const SizedBox(
                  width: 370.0,
                  height: 60.0,
                  child: Center(
                    child: Text(
                      "Little John",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40.0
                      ),
                    ),
                  ),
                )
              ],
            )
          )
        ],
      )
    );
  }
}