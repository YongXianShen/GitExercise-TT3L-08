import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mmusuperapp/appInfo/app_info.dart';
import 'package:mmusuperapp/authentication/login_screen.dart';
import 'package:mmusuperapp/food/models/restaurant.dart';
import 'package:mmusuperapp/food/themes/theme_provider.dart';
import 'package:mmusuperapp/homepage.dart';
import 'package:mmusuperapp/hostel/codes/swipe_state.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mmusuperapp/hostel/codes/hostel_male_user.dart';

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
      create: (context) => ThemeProvider(),

    ),

    ChangeNotifierProvider(create: (context) => Restaurant()),

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
        return ChangeNotifierProvider(
          create: (context) => AppInfo(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme:themeProvider.themeData,
            home: const HomePage(),
          ),
        );
      }
    );  
  }
}
