import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mmusuperapp/authentication/login_screen.dart';
import 'package:mmusuperapp/authentication/signup_screen.dart';
import 'package:mmusuperapp/homepage.dart';
import 'package:permission_handler/permission_handler.dart';


Future<void> main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await Permission.locationWhenInUse.isDenied.then((valueOfPermission)
  {
    if(valueOfPermission)
      {
        Permission.locationWhenInUse.request();
      }
  });

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
          home: LoginScreen(),
     
    );
  }
}