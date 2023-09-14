import 'package:json_to_ui/Sign_up.dart';
import 'dart:convert';
import 'package:json_to_ui/profile_page.dart';
import 'package:json_to_ui/splash_screen.dart';
import 'package:json_to_ui/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:json_to_ui/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:json_to_ui/login_credentials.dart';

bool boolVal = false;
bool? boolApi;

Map<String, dynamic>? loginCredentialsDisplay = {};
Map<String, dynamic>? login_credentails = {};
Map<String, dynamic>? login_credentailsApi = {};
final nameController = TextEditingController();
final emailController = TextEditingController();
final passwordController = TextEditingController();
String? finalEmail;

String? finalPassword;

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    Future getValidationData() async {
      await Future.delayed(const Duration(seconds: 0));
      var obtainEmail = sharedprefrance!.getString("email");
      var obtainName = sharedprefrance!.getString("name");
      var obtainPassword = sharedprefrance!.getString("password");

      finalEmail = obtainEmail;
      global_name = obtainName!;
      finalPassword = obtainPassword;

      if (login_credentailsApi!.isEmpty) {
        final user_response = await http.read(Uri.parse(
            'https://s3.eu-west-1.amazonaws.com/bbi.appsdata.2013/for_development/user_details.json'));
        login_credentailsApi = json.decode(user_response);
        loginCredentialsDisplay = {};
        // global_name = login_credentailsApi!['name'];
        // global_name = "";
        loginCredentialsDisplay!['email'] = login_credentailsApi!['email'];
        loginCredentialsDisplay!['password'] =
            login_credentailsApi!['password'];
        print(global_name);
        print(login_credentailsApi);
        return login_credentails = login_credentailsApi;
      } else {
        loginCredentialsDisplay = {};
        // global_name = login_credentailsApi!['name'];
        // global_name = "";
        loginCredentialsDisplay!['email'] = login_credentailsApi!['email'];
        loginCredentialsDisplay!['password'] =
            login_credentailsApi!['password'];
        print(global_name);
        return login_credentails = login_credentailsApi;
      }
      // print(finalEmail);
    }

    // Scaffold is a layout for
    // the major Material Components.
    return Scaffold(
        appBar: AppBar(
          leading: const IconButton(
            icon: Icon(Icons.menu),
            tooltip: 'Navigation Bar',
            onPressed: null,
          ),
          title: const Text('Json to UI'),
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
                      'Sign In',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    )),
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
                                  Future<dynamic> checked() async {
                                    await sharedprefrance!
                                        .setBool('checkbox', boolVal);
                                  }

                                  ;
                                  setState(() {
                                    boolVal = value!;
                                    checked();
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
                          child: const Text('Sign In'),
                          onPressed: () async {
                            // print(nameController.text);
                            // print(passwordController.text);
                            // String pattern =
                            //     r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                            // RegExp regExp = new RegExp(pattern);
                            // regExp.hasMatch(value);

                            await getValidationData();

                            if (emailController.text.isEmpty &&
                                passwordController.text.isEmpty) {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return const AlertDialog(
                                      title: Text("please enter all details"),
                                    );
                                  });
                            } else if (emailController.text ==
                                    login_credentails!['email'] &&
                                passwordController.text ==
                                    login_credentails!['password']) {
                              boolApi = true;
                              Navigator.pushReplacementNamed(context, 'home');
                            } else if (emailController.text == finalEmail &&
                                passwordController.text == finalPassword) {
                              boolApi = false;
                              Navigator.pushReplacementNamed(context, 'home');
                            } else {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return const AlertDialog(
                                      title: Text(
                                          "username password did'nt matched"),
                                    );
                                  });
                            }
                          },
                        )),
                  ],
                ),
                Row(children: <Widget>[
                  const Text('Does not have account?'),
                  TextButton(
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, 'login');
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
