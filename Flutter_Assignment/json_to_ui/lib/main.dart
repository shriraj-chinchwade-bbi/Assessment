import 'dart:async';
import 'package:flutter/material.dart';
import 'package:json_to_ui/Sign_up.dart';
import 'package:json_to_ui/bloc_dummy_bloc.dart';
import 'package:json_to_ui/profile_page.dart';
import 'package:json_to_ui/splash_screen.dart';
import 'package:json_to_ui/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:json_to_ui/sign_in.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:json_to_ui/login_credentials.dart';

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
    return ChangeNotifierProvider(
      create: (_) => UserName(),
      child: MaterialApp(home: BlocHandler()),
      // MaterialApp(
      // debugShowCheckedModeBanner: false,
      // initialRoute: 'splash',
      // routes: {
      //   'splash': (context) => SplashScreen(),
      //   'login': (context) => SignUp(),
      //   'signIn': (context) => SignIn(),
      //   'profile_page': (context) => ProfilePage(),
      //   'home': (context) => HomeScreen(),
      // })
    );
  }
}

class BlocHandler extends StatelessWidget {
  const BlocHandler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DummyBloc>(create: (BuildContext context) => DummyBloc())
      ],
      child: BlocBuilder<DummyBloc, DummyState>(
        builder: (BuildContext context, state) {
          if (state is SplashScreenState) {
            return SplashScreen();
          } else if (state is SignInState) {
            return SignIn();
          } else if (state is HomeScreenState) {
            return HomeScreen();
          } else if (state is ProfilePageState) {
            return ProfilePage();
          }

          return SplashScreen();
        },
      ),
    );
  }
}
// class SharedPrefrenceMnager {
//   late SharedPreferences preferences;
//   Future<SharedPreferences> async{preferences=await SharedPreferences.getInstance(); };
// }
