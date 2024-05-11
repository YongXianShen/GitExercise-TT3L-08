import 'package:flutter/material.dart';
import 'package:mmusuperapp/authentication/signup_screen.dart';
import 'package:mmusuperapp/homepage.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.black,
        ),
          home: SignUpScreen(),
     
    );
  }
}