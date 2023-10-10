import 'package:clean_json_to_ui/features/home_screen/presentation/widgets/display_guidelines.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:clean_json_to_ui/core/util/utility.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:provider/provider.dart';

import 'package:clean_json_to_ui/features/home_screen/data/model/home_screen_guideline_model.dart'
    as modal;
import 'package:http/http.dart' as http;
import 'package:clean_json_to_ui/features/home_screen/presentation/widgets/color_from_hex.dart';

import '../../../../core/util/UserName.dart';
import '../../../../injection_container.dart';
import '../../data/repositories/home_screen_repository_impl.dart';
import '../bloc/home_screen_bloc.dart';

// import 'package:collection/collection.dart';

class HomeScreenPage extends StatelessWidget {
  const HomeScreenPage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MyHomePage(title: 'Json to UI');
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // final nameprovider = Provider.of<UserName>(context);
    return Scaffold(
        appBar:
            AppBar(title: const Text('Json UI GuideLines'), actions: <Widget>[
          const Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: Text(
              "Internet Api",
              style: TextStyle(fontSize: 15),
            ),
          ),
          CupertinoSwitch(
            // This bool value toggles the switch.
            value: switchValue,
            activeColor: CupertinoColors.activeGreen,
            trackColor: CupertinoColors.destructiveRed,
            thumbColor: CupertinoColors.white,
            focusColor: CupertinoColors.systemGrey3,
            onChanged: (bool? value) {
              // This is called when the user toggles the switch.
              setState(() {
                switchValue = value ?? true;
              });
            },
          ),
          Row(
            children: [
              // Consumer<UserName>(builder: (context, UserName, child) {
              //   return Text(global_name);
              // }),
              IconButton(
                  icon: const Icon(Icons.account_circle),
                  tooltip: 'profile',
                  onPressed: () {
                    // BlocProvider.of<DummyBloc>(context).loadProfilePage();
                  }),
            ],
          ),
        ]),
        // body is the majority of the screen.
        body: FutureBuilder<List<modal.GuideLinesModal>>(
            future: sl<HomeScreenBloc>().callDecider(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child:
                      // CircularProgressIndicator()
                      Image.asset(
                    "assets/image.gif",
                    height: 600.0,
                    width: 400.0,
                  ),
                ); // Show a loading indicator while data is being fetched.
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                listGuideLineModal = snapshot.data!;
                return DisplayGuideLines();
              }
            }));
  }
}
