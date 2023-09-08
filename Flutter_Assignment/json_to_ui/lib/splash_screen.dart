import 'dart:async';
import 'package:flutter/material.dart';
import 'package:json_to_ui/Sign_up.dart';
import 'package:json_to_ui/profile_page.dart';
import 'package:json_to_ui/splash_screen.dart';
import 'package:json_to_ui/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? finalEmail;
String? finalName;
String? finalPassword;

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
    getValidationData().whenComplete(() async {
      Timer(Duration(seconds: 5), () {
        if (finalEmail == null && finalName == null && finalPassword == null) {
          Navigator.pushNamed(context, 'home');
        } else {
          Navigator.pushNamed(context, 'login');
        }
        // Navigator.pushNamed(
        //     context, 'login'
        // );
      });
    });
  }

  Future getValidationData() async {
    final SharedPreferences sharedprefrance =
        await SharedPreferences.getInstance();
    var obtainEmail = sharedprefrance.getString("email");
    var obtainName = sharedprefrance.getString("name");
    var obtainPassword = sharedprefrance.getString("password");
    setState(() {
      finalEmail = obtainEmail;
      finalName = obtainName;
      finalPassword = obtainPassword;
    });
    // print(finalEmail);
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
