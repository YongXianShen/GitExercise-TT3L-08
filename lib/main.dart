import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mmusuperapp/authentication/login_screen.dart';
import 'package:mmusuperapp/authentication/signup_screen.dart';
import 'package:mmusuperapp/food/themes/theme_provider.dart';
import 'package:mmusuperapp/homepage.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';


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

  runApp(
    MultiProvider(
    providers:[
    ChangeNotifierProvider(
      create: (context) => ThemeProvider()
    ),
  ],
  child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.black,
        ),
          home: LoginScreen(),);});
     
    
  }}
