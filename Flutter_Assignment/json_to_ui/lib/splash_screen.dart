import 'dart:async';
import 'package:flutter/material.dart';
import 'package:json_to_ui/Sign_up.dart';
import 'package:json_to_ui/profile_page.dart';
import 'package:json_to_ui/splash_screen.dart';
import 'package:json_to_ui/home_screen.dart';
import 'package:json_to_ui/main.dart';
import 'package:json_to_ui/sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _MyAppSplashState createState() => new _MyAppSplashState();
}

class _MyAppSplashState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // new Future.delayed(const Duration(seconds: 1),
    //     () => Navigator.pushNamed(context, 'login'));

    Timer(Duration(seconds: 1), () {
      final bool? check1 = sharedprefrance!.getBool('checkbox');
      if (check1 == true) {
        Navigator.pushReplacementNamed(context, 'home');
      } else {
        Navigator.pushReplacementNamed(context, 'signIn');
      }

      // Navigator.pushNamed(
      //     context, 'login'
      // );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Text(
              "Control Uday, Control",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Divider(
            height: 100.0,
            color: Colors.white,
          ),
          Image.asset(
            "assets/welcome.gif",
            height: 600.0,
            width: 400.0,
          ),
          Divider(
            height: 10,
            color: Colors.white,
          ),
        ]),
      ),
    );
  }
}
