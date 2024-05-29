import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mmusuperapp/profile_pictures/text_box.dart';

class ProfilePic extends StatefulWidget {
  const ProfilePic({super.key});

  @override
  State<ProfilePic> createState() => _ProfilePicState();
}

class _ProfilePicState extends State<ProfilePic> {

  final currentUser = FirebaseAuth.instance.currentUser!;

  Future<void> editField(String field) async {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[900],
      appBar: AppBar(
        title: const Text("Profile Page"),
        backgroundColor: Colors.indigo[200],

      ),
      body: ListView(
        children: [
          const Icon(
            Icons.person,
            size: 72,
          ),
          Text(
            currentUser.email!,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey[600] ),
          ),
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Text(
              "My Details",
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),
          MyTextBox(
            text: "Yong Xian Shen",
            sectionName: "Username",
            onPressed: () => editField("username"),
          ),
          MyTextBox(
            text: "empty bio",
            sectionName: "bio",
            onPressed: () => editField("bio"),
          ),
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Text(
              "My Posts",
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),
        ],
      ),
    );
  }
}