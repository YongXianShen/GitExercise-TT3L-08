import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';
import 'package:mmusuperapp/appInfo/app_info.dart';
import 'package:mmusuperapp/authentication/login_screen.dart';
import 'package:mmusuperapp/food/models/restaurant.dart';
import 'package:mmusuperapp/food/themes/theme_provider.dart';
import 'package:mmusuperapp/homepage.dart';
import 'package:mmusuperapp/hostel/codes/swiping.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mmusuperapp/hostel/codes/hostel_male_user.dart' as hostel;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await Permission.locationWhenInUse.isDenied.then((valueOfPermission) {
    if (valueOfPermission) {
      Permission.locationWhenInUse.request();
    }
  });

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
        ChangeNotifierProvider(create: (context) => Restaurant()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  auth.User? user;

  @override
  void initState() {
    super.initState();
    auth.FirebaseAuth.instance.authStateChanges().listen((auth.User? user) {
      setState(() {
        this.user = user;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => SwipeBloc()
              ..add(
                LoadUsers(users: hostel.User.users),
              )),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return ChangeNotifierProvider(
            create: (context) => AppInfo(),
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: themeProvider.themeData,
              home: user == null ? const LoginScreen() : HomePage(),
            ),
          );
        },
      ),
    );
  }
}
