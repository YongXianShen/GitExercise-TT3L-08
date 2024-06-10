import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:mmusuperapp/authentication/signup_screen.dart';
import 'package:mmusuperapp/global/global_var.dart';

import '../homepage.dart';
import '../methods/common_methods.dart';
import '../widgets/loading_dialog.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  CommonMethods cMethods = CommonMethods();

  signInFormValidation() {
    if (!emailTextEditingController.text.contains("@")) {
      cMethods.displaySnackBar("Invalid Email", context);
    } else if (passwordTextEditingController.text.trim().length < 5) {
      cMethods.displaySnackBar("Your password needs to have at least 6 or more characters", context);
    } else {
      signInUser();
    }
  }

  signInUser() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => LoadingDialog(messageText: "Logging in...."),
    );

    try {
      final User? userFirebase = (
          await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailTextEditingController.text.trim(),
            password: passwordTextEditingController.text.trim(),
          )
      ).user;

      if (!context.mounted) return;
      Navigator.pop(context);

      if (userFirebase != null) {
        DatabaseReference usersRef = FirebaseDatabase.instance.ref().child("users").child(userFirebase.uid);
        usersRef.once().then((snap) {
          if (snap.snapshot.value != null) {
            if ((snap.snapshot.value as Map)["blockStatus"] == "no") {
              userName = (snap.snapshot.value as Map)["name"];
              userPhone = (snap.snapshot.value as Map)["phone"];
              // Navigate to HomePage
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (c) => HomePage()));
            } else {
              FirebaseAuth.instance.signOut();
              cMethods.displaySnackBar("Your account is blocked. If you think there is a mistake, contact 01121885185", context);
            }
          } else {
            FirebaseAuth.instance.signOut();
            cMethods.displaySnackBar("The account does not exist.", context);
          }
        });
      }
    } catch (error) {
      Navigator.pop(context);
      cMethods.displaySnackBar(error.toString(), context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.black,
        ), // Force light theme for this page
      child:  Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Image.asset("assets/images/logo.png"),
              const Text(
                'Login as a User',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                ),
              ),

              // Text Fields & Sign Up Button
              Padding(
                padding: const EdgeInsets.all(22),
                child: Column(
                  children: [
                    TextField(
                      controller: emailTextEditingController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: "User Email",
                        labelStyle: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),

                    const SizedBox(height: 22,),

                    TextField(
                      controller: passwordTextEditingController,
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        labelText: "User Password",
                        labelStyle: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),

                    const SizedBox(height: 42,),

                    ElevatedButton(
                      onPressed: () {
                        signInFormValidation();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          padding: EdgeInsets.symmetric(horizontal: 60, vertical: 10)
                      ),
                      child: const Text("Log In"),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12,),

              // Text Button
              TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (c) => SignUpScreen()));
                },
                child: Text(
                  "Don't have an account? Sign Up here",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

