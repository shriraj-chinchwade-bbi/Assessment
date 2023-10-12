import 'package:clean_json_to_ui/features/authentication/presentation/pages/authentication_sign_up.dart';
import 'package:clean_json_to_ui/features/home_screen/presentation/bloc/home_screen_bloc.dart';
import 'package:clean_json_to_ui/features/home_screen/presentation/pages/home_screen_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matcher/expect.dart';
import 'package:clean_json_to_ui/features/authentication/data/datasources/authentication_data_source.dart';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../../core/util/utility.dart';
import '../../../../injection_container.dart';
import '../../../../main.dart';
import '../../../home_screen/presentation/pages/home_screen_page.dart';
import '../../data/repositories/authentication_repository_impl.dart';
import '../bloc/authentication_bloc.dart';
import '../widgets/authentication_validation.dart';

class AuthenticationSignIn extends StatefulWidget {
  const AuthenticationSignIn({super.key});

  @override
  State<AuthenticationSignIn> createState() => _AuthenticationSignInState();
}

class _AuthenticationSignInState extends State<AuthenticationSignIn> {
  @override
  Widget build(BuildContext context) {
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
                    const SizedBox(
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
                            // BlocBuilder<HomeScreenBloc, AuthenticationState>(
                            //   builder: (context, state) {
                            //     // TODO: build UI based on CounterBloc's state.
                            //     sl<AuthenticationBloc>().callAuthentication();
                            //     return HomeScreenPage();
                            //   },
                            // );
                            print(decision);
                            if (emailController.text.isEmpty ||
                                passwordController.text.isEmpty) {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return const AlertDialog(
                                      title: Text("please enter all details"),
                                    );
                                  });
                            }
                            await sl<AuthenticationBloc>()
                                .callAuthenticationSignIn();

                            print(decision);
                            if (decision == false) {
                              emailController.clear();
                              nameController.clear();
                              passwordController.clear();
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return const AlertDialog(
                                      title: Text("wrong credentials"),
                                    );
                                  });
                            } else if (decision == true) {
                              emailController.clear();
                              nameController.clear();
                              passwordController.clear();
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => HomeScreenPage()),
                              // );
                              BlocProvider.of<AuthenticationBloc>(context)
                                  .loadSigninScreen();
                            }
                            // if (emailController.text.isEmpty &&
                            //     passwordController.text.isEmpty) {
                            //   showDialog(
                            //       context: context,
                            //       builder: (BuildContext context) {
                            //         return const AlertDialog(
                            //           title: Text("please enter all details"),
                            //         );
                            //       });
                            // } else if (emailController.text ==
                            //         login_credentails['email'] &&
                            //     passwordController.text ==
                            //         login_credentails['password']) {
                            //   boolApi = true;
                            //   // BlocProvider.of<HomeScreenBloc>(context)
                            //   //     .callDecider();
                            //   Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => HomeScreenPage()),
                            //   );
                            // } else if (emailController.text == finalEmail &&
                            //     passwordController.text == finalPassword) {
                            //   boolApi = false;
                            //   // BlocProvider.of<HomeScreenBloc>(context)
                            //   //     .callDecider();
                            //   Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => HomeScreenPage()),
                            //   );
                            // } else {
                            //   showDialog(
                            //       context: context,
                            //       builder: (BuildContext context) {
                            //         return const AlertDialog(
                            //           title: Text(
                            //               "username password did'nt matched"),
                            //         );
                            //       });
                            // }
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
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => AuthenticationSignUp()),
                      // );
                      BlocProvider.of<AuthenticationBloc>(context)
                          .loadSigninToSignupScreen();
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
