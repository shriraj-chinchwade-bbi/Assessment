import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:json_to_ui/Sign_up.dart';
import 'package:json_to_ui/main.dart';
import 'package:json_to_ui/profile_page.dart';
import 'package:json_to_ui/sign_in.dart';
import 'package:json_to_ui/splash_screen.dart';
import 'package:json_to_ui/home_screen.dart';
import 'package:json_to_ui/login_credentials.dart';

final updateNameController = TextEditingController();

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

String credentials() {
  if (boolApi == true) {
    return "Name:${global_name}\nEmail:${login_credentailsApi!['email']}";
  } else {
    return "Name:${global_name}\nEmail:${finalEmail}";
  }
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final nameprovider = Provider.of<UserName>(context);
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
                child: Text(credentials()),
              ),
              IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                              title: Text("Edit Name"),
                              content: SizedBox(
                                height: 130,
                                child: Column(
                                  children: [
                                    TextField(
                                      controller: updateNameController,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'new Name',
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        nameprovider.changeName(
                                            updateNameController.text);
                                        if (boolApi == false) {
                                          sharedprefrance!.setString("name",
                                              updateNameController.text);
                                        }
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text(
                                        'Update Name',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 25),
                                      ),
                                    ),
                                  ],
                                ),
                              ));
                        });
                  },
                  icon: Icon(Icons.abc_sharp)),
              ElevatedButton(
                child: const Text('Log Out'),
                onPressed: () async {
                  await sharedprefrance!.remove('checkbox');
                  // Navigator.pushReplacementNamed(context, 'signIn');
                  Navigator.pushNamedAndRemoveUntil(
                      context, 'signIn', (route) => false);
                },
              ),
            ])),
      ]),
    );
  }
}
