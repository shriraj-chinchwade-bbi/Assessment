import 'package:json_to_ui/Sign_up.dart';
import 'package:json_to_ui/profile_page.dart';
import 'package:json_to_ui/splash_screen.dart';
import 'package:json_to_ui/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    bool boolVal = false;
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    bool? value;
    // Scaffold is a layout for
    // the major Material Components.
    return Scaffold(
        appBar: AppBar(
          leading: const IconButton(
            icon: Icon(Icons.menu),
            tooltip: 'Navigation Bar',
            onPressed: null,
          ),
          title: const Text('Example title'),
          actions: const [
            IconButton(
              icon: Icon(Icons.search),
              tooltip: 'Search',
              onPressed: null,
            ),
          ],
        ),
        // body is the majority of the screen.
        body: ListView(children: [
          Column(
            children: [
              Container(
                height: 300.0,

                decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: NetworkImage(
                        'https://img.freepik.com/premium-vector/closed-padlock-digital-background-cyber-security_42077-12247.jpg?w=360',
                      ),
                      fit: BoxFit.fill),
                  color: Colors.indigo.shade800,
                  // boxShadow: const [BoxShadow(blurRadius: 30.0)],
                  borderRadius: BorderRadius.vertical(
                      bottom: Radius.elliptical(
                          MediaQuery.of(context).size.width, 100.0)),
                ),
                // child: Text('Hello, world!'),
              ),
            ],
          ),
          Container(
            height: 500.0,
            width: 400,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      'Sign Up',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    )),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Name',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                    // validator: Validators.compose([
                    //   Validators.patternString(
                    //       r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
                    //       'Invalid Password')
                    // ]),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    //forgot password screen
                  },
                  child: const Text(
                    'Forgot Password',
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                        height: 24.0,
                        width: 50.0,
                        child: Theme(
                            data: ThemeData(
                                unselectedWidgetColor: Color(0xff00C8E8)),
                            child: Checkbox(
                                value: boolVal,
                                activeColor: Color(0xff00C8E8),
                                // value: isCheckedRememberMe,
                                onChanged: (bool? value) {
                                  setState(() async {
                                    boolVal = value!;
                                    SharedPreferences sharedprefrance =
                                        await SharedPreferences.getInstance();
                                    sharedprefrance.setString(
                                        'email', emailController.text);
                                    sharedprefrance.setString(
                                        'name', nameController.text);
                                    sharedprefrance.setString(
                                        'password', passwordController.text);
                                  });
                                }))),
                    SizedBox(
                      width: 110.0,
                      child: Text("Remember Me",
                          style: TextStyle(
                            color: Color(0xff646464),
                            fontSize: 16,
                          )),
                    ),
                    Container(
                        height: 50,
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: ElevatedButton(
                          child: const Text('Login'),
                          onPressed: () async {
                            // print(nameController.text);
                            // print(passwordController.text);
                            // String pattern =
                            //     r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                            // RegExp regExp = new RegExp(pattern);
                            // regExp.hasMatch(value);

                            Navigator.popAndPushNamed(context, 'home');
                          },
                        )),
                  ],
                ),
                Row(children: <Widget>[
                  const Text('Does not have account?'),
                  TextButton(
                    child: const Text(
                      'Sign in',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      //signup screen
                    },
                  )
                ])
              ],
            ),
          ),
        ]));
  }
}
