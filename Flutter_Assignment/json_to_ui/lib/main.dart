import 'dart:async';
import 'package:flutter/material.dart';
import 'package:json_to_ui/Sign_up.dart';
import 'package:json_to_ui/profile_page.dart';
import 'package:json_to_ui/splash_screen.dart';
import 'package:json_to_ui/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:json_to_ui/sign_in.dart';

SharedPreferences? sharedprefrance;

void main() async {
  runApp(MyApp());
  sharedprefrance = await SharedPreferences.getInstance();
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: 'splash',
        routes: {
          'splash': (context) => SplashScreen(),
          'login': (context) => SignUp(),
          'signIn': (context) => SignIn(),
          'profile_page': (context) => ProfilePage(),
          'home': (context) => HomeScreen(),
        });
  }
}

// class SharedPrefrenceMnager {
//   late SharedPreferences preferences;
//   Future<SharedPreferences> async{preferences=await SharedPreferences.getInstance(); };
// }
