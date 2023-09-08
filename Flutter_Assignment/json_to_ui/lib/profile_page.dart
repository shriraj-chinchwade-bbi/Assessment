import 'package:flutter/material.dart';

import 'package:json_to_ui/Sign_up.dart';
import 'package:json_to_ui/profile_page.dart';
import 'package:json_to_ui/splash_screen.dart';
import 'package:json_to_ui/home_screen.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    bool? value;
    // Scaffold is a layout for
    // the major Material Components.
    return Scaffold(
      appBar: AppBar(title: const Text('Json UI GuideLines'), actions: <Widget>[
        // IconButton(
        //     icon: Icon(Icons.menu),
        //     tooltip: 'Navigation Bar',
        //     onPressed: Navigator.pushNamed(context, 'routeName');
        // ),
      ]),
      // body is the majority of the screen.
      body: ListView(children: [
        Container(
            height: 500.0,
            width: 400,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(children: <Widget>[
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'PROFILE PAGE',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  )),
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name',
                  ),
                ),
              ),
              ElevatedButton(
                child: const Text('Log Out'),
                onPressed: () {
                  Navigator.pushNamed(context, 'login');
                },
              ),
            ])),
      ]),
    );
  }
}
