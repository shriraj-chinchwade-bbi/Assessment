import 'package:clean_json_to_ui/features/authentication/presentation/pages/authentication_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter/material.dart';

import '../../../../core/util/utility.dart';
import '../../../../injection_container.dart';
import '../../../../main.dart';
import '../bloc/authentication_bloc.dart';

// String? finalEmail;
// String? finalName;
// String? finalPassword;

class AuthenticationSignUp extends StatefulWidget {
  const AuthenticationSignUp({super.key});

  @override
  State<AuthenticationSignUp> createState() => _AuthenticationSignUpState();
}

class _AuthenticationSignUpState extends State<AuthenticationSignUp> {
  @override
  Widget build(BuildContext context) {
    // Future getValidationData() async {
    //   var obtainEmail = sharedprefrance!.getString("email");
    //   var obtainName = sharedprefrance!.getString("name");
    //   var obtainPassword = sharedprefrance!.getString("password");
    //
    //   // setState(() {
    //   //   finalEmail = obtainEmail;
    //   //   finalName = obtainName;
    //   //   finalPassword = obtainPassword;
    //   // });
    //   // print(finalEmail);
    //   if (obtainEmail != null && obtainName != null && obtainPassword != null) {
    //     Navigator.pushNamed(context, 'home');
    //   }
    // }

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
                // TextButton(
                //   onPressed: () {
                //     //forgot password screen
                //   },
                //   child: const Text(
                //     'Forgot Password',
                //   ),
                // ),
                Row(
                  children: [
                    // SizedBox(
                    //     height: 24.0,
                    //     width: 50.0,
                    //     child: Theme(
                    //         data: ThemeData(
                    //             unselectedWidgetColor: Color(0xff00C8E8)),
                    //         child: Checkbox(
                    //             value: boolVal,
                    //             activeColor: Color(0xff00C8E8),
                    //             // value: isCheckedRememberMe,
                    //             onChanged: (bool? value) {
                    //               setState(() {
                    //                 boolVal = value!;
                    //                 rememberMe = 1;
                    //               });
                    //             }))),
                    // SizedBox(
                    //   width: 110.0,
                    //   child: Text("Remember Me",
                    //       style: TextStyle(
                    //         color: Color(0xff646464),
                    //         fontSize: 16,
                    //       )),
                    // ),
                    Container(
                        height: 50,
                        padding: const EdgeInsets.fromLTRB(170, 0, 10, 0),
                        child: ElevatedButton(
                          child: const Text('Register'),
                          onPressed: () {
                            // print(nameController.text);
                            // print(passwordController.text);

                            String patternPassword =
                                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                            RegExp regExpPassword = RegExp(patternPassword);
                            String patternEmail =
                                r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
                            RegExp regExpEmail = RegExp(patternEmail);

                            if (regExpPassword
                                    .hasMatch(passwordController.text) ==
                                false) {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return const AlertDialog(
                                      title: Text(
                                          "password must be 8 character with Cap,small,numeric,special char"),
                                    );
                                  });
                            } else if (regExpEmail
                                    .hasMatch(emailController.text) ==
                                false) {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return const AlertDialog(
                                      title: Text("Email is not valid"),
                                    );
                                  });
                            } else if (nameController.text.isEmpty) {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return const AlertDialog(
                                      title: Text("Please enter name"),
                                    );
                                  });
                            } else {
                              // try {
                              // sharedprefrance.setString(
                              //     'email', emailController.text.toString());
                              // sharedprefrance.setString(
                              //     'name', nameController.text);
                              // sharedprefrance.setString(
                              //     'password', passwordController.text);
                              // print(sharedprefrance.getString("name"));
                              // print(sharedprefrance.getString("email"));
                              // print(sharedprefrance.getString("password"));
                              sl<AuthenticationBloc>()
                                  .callAuthenticationSignUp();

                              // } catch (e) {
                              //   throw Exception("error:$e");
                              // }

                              // if (emailController.text != null &&
                              //     nameController.text != null &&
                              //     passwordController.text != null) {
                              //   showDialog(
                              //       context: context,
                              //       builder: (BuildContext context) {
                              //         return AlertDialog(
                              //           title: Text("please enter all details"),
                              //         );
                              //       });
                              // } else {
                              //   getValidationData();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        AuthenticationSignIn()),
                              );
                            }
                            // }
                          },
                        )),
                  ],
                ),
                // Row(children: <Widget>[
                //   const Text('Does not have account?'),
                //   TextButton(
                //     child: const Text(
                //       'Sign in',
                //       style: TextStyle(fontSize: 20),
                //     ),
                //     onPressed: () {
                //       //signup screen
                //     },
                //   )
                // ])
              ],
            ),
          ),
        ]));
  }
}
