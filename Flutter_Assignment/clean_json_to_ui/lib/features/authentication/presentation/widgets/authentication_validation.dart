import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';

import '../../../../core/util/utility.dart';

String? signInToken;
AuthenticationValidation() {
  if (emailController.text.isEmpty && passwordController.text.isEmpty) {
    return signInToken = 'no input';
    // showDialog(
    //     context: context,
    //     builder: (BuildContext context) {
    //       return const AlertDialog(
    //         title: Text("please enter all details"),
    //       );
    //     });
  } else if (emailController.text == login_credentails['email'] &&
      passwordController.text == login_credentails['password']) {
    boolApi = true;
    return signInToken = 'api matched';
    // BlocProvider.of<DummyBloc>(context)
    //     .loadHomeScreen();
  } else if (emailController.text == finalEmail &&
      passwordController.text == finalPassword) {
    boolApi = false;
    return signInToken = 'sharedpref matched';
    // BlocProvider.of<DummyBloc>(context)
    //     .loadHomeScreen();
  } else {
    return signInToken = 'no match';
    // showDialog(
    //     context: context,
    //     builder: (BuildContext context) {
    //       return const AlertDialog(
    //         title: Text(
    //             "username password did'nt matched"),
    //       );
    //     });
  }
}
