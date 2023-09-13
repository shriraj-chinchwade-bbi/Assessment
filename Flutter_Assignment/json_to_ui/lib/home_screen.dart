import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:json_to_ui/Sign_up.dart';
import 'package:json_to_ui/profile_page.dart';
import 'package:json_to_ui/splash_screen.dart';
import 'package:json_to_ui/home_screen.dart';
import 'package:json_to_ui/sign_in.dart';
import 'guideline_modal.dart' as modal;
import 'package:http/http.dart' as http;

// import 'package:collection/collection.dart';

Color colorFromHex(String hexColor) {
  return Color(int.parse(hexColor.replaceAll("#", "0xff")));
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MyHomePage(title: 'Json to UI');
  }
}

var now = DateTime.now();
var berlinWallFell = DateTime.utc(2023, 9, 12);
var moonLanding = DateTime.parse("2023-09-12 13:06:04Z");
List<modal.GuideLinesModal> listGuideLineModal = [];
List<modal.GuideLinesModal> listGuideLineModalOnline = [];
List<modal.GuideLinesModal> listGuideLineModalOffline = [];
bool switchValue = false;

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Fetch content from the json file
  Future<List<modal.GuideLinesModal>> readJson() async {
    await Future.delayed(const Duration(seconds: 0));

    try {
      if (switchValue == true) {
        if (listGuideLineModalOnline.isEmpty) {
          // List<modal.GuideLinesModal> listGuideLineModalOnline = [];
          final response = await http.read(Uri.parse(
              'https://raw.githubusercontent.com/shriraj-chinchwade-bbi/Assessment/main/Flutter_Assignment/json_to_ui/assets/temp.json'));
          final List<dynamic> jsonResponse = json.decode(response);
          listGuideLineModalOnline = jsonResponse
              .map((data) => modal.GuideLinesModal.fromJson(data))
              .toList();
          print(DateTime.now().millisecondsSinceEpoch);
          print("api fetched");
          return listGuideLineModal = listGuideLineModalOnline;
        } else {
          return listGuideLineModal = listGuideLineModalOnline;
        }
        // return json.decode(response);
      } else {
        List<modal.GuideLinesModal> listGuideLineModalOffline = [];
        final String response = await rootBundle.loadString('assets/temp.json');
        final data = await json.decode(response);
        // modal.GuideLinesModal obj = modal.GuideLinesModal.fromJson(data[0]);
        // print(obj);
        for (int i = 0; i < data.length; i++) {
          listGuideLineModalOffline
              .add(modal.GuideLinesModal.fromJson(data[i]));
        }
        // print(listGuideLineModal[0].sequenceNo);
        listGuideLineModalOffline.sort((a, b) =>
            num.parse(a.sequenceNo!).compareTo(num.parse(b.sequenceNo!)));
        // print(listGuideLineModal[0].sequenceNo);
        // setState(() {
        //   _items = data[0]["items"];
        // });
        print(DateTime.now().millisecondsSinceEpoch);
        print("local data used");
        return listGuideLineModal = listGuideLineModalOffline;
      }
    } catch (e) {
      throw Exception("error:$e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            AppBar(title: const Text('Json UI GuideLines'), actions: <Widget>[
          const Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: Text(
              "Internet Api",
              style: TextStyle(fontSize: 18),
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
          IconButton(
              icon: const Icon(Icons.account_circle),
              tooltip: 'Navigation Bar',
              onPressed: () {
                Navigator.pushNamed(context, 'profile_page');
              }),
        ]),
        // body is the majority of the screen.
        body: FutureBuilder<List<modal.GuideLinesModal>>(
            future: readJson(),
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
                return ListView.builder(
                    itemCount: listGuideLineModal.length,
                    itemBuilder: (context, index) {
                      modal.GuideLinesModal guideLineModal =
                          listGuideLineModal[index];
                      return Column(
                        children: [
                          SizedBox(
                            height: 150,
                            width: 400,
                            child: Column(
                              children: [
                                Text(
                                  guideLineModal.categoryName!,
                                ),
                                SizedBox(
                                  width: 1000,
                                  height: 100,
                                  child: ListView.builder(
                                      itemCount: guideLineModal.items!.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        modal.Items itemModal =
                                            guideLineModal.items![index];
                                        return Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Row(
                                            children: [
                                              Container(
                                                color: colorFromHex(itemModal
                                                    .defaultProperties!
                                                    .color!
                                                    .themeColor!),
                                                width: 10,
                                                height: 100,
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    width: 4,
                                                    color: Colors
                                                        .black, //                   <--- border width here
                                                  ),
                                                  color: colorFromHex(itemModal
                                                      .defaultProperties!
                                                      .color!
                                                      .backgroundColor!),
                                                ),
                                                height: 100,
                                                width: 100,
                                                child: Text(
                                                  '${itemModal.id!}\n${itemModal.tag!}',
                                                  style: TextStyle(
                                                    color: colorFromHex(
                                                        itemModal
                                                            .defaultProperties!
                                                            .color!
                                                            .textColor!),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      }),
                                ),
                              ],
                            ),
                          ),
                          Visibility(
                            visible: guideLineModal.showOnlySubCategory!,
                            child: SizedBox(
                              height: 150,
                              width: 400,
                              child: Column(
                                children: [
                                  Text(
                                    guideLineModal.subCategory!.title!,
                                  ),
                                  SizedBox(
                                    width: 1000,
                                    height: 100,
                                    child: ListView.builder(
                                        itemCount: guideLineModal
                                            .subCategory!.items!.length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          modal.Items1 itemModal =
                                              guideLineModal
                                                  .subCategory!.items![index];
                                          return Padding(
                                            padding: const EdgeInsets.all(3.0),
                                            child: GestureDetector(
                                              onTap: () {
                                                showDialog(
                                                    context: context,
                                                    builder:
                                                        (BuildContext context) {
                                                      return AlertDialog(
                                                        title: Text(
                                                            "target: ${itemModal.defaultProperties!.onClick!.target!}\n${itemModal.defaultProperties!.onClick!.parameter!}"),
                                                      );
                                                    });
                                              },
                                              child: Row(
                                                children: [
                                                  Container(
                                                    // decoration: BoxDecoration(border: Border.all(color: Colors.black),borderRadius: ),
                                                    color: colorFromHex(
                                                        itemModal
                                                            .defaultProperties!
                                                            .color!
                                                            .themeColor!),
                                                    width: 10,
                                                    height: 100,
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                        width: 3,
                                                        color: Colors
                                                            .black, //                   <--- border width here
                                                      ),
                                                      color: colorFromHex(
                                                          itemModal
                                                              .defaultProperties!
                                                              .color!
                                                              .backgroundColor!),
                                                    ),
                                                    height: 100,
                                                    width: 100,
                                                    child: Text(
                                                      '${itemModal.id!}\n${itemModal.name!}',
                                                      style: TextStyle(
                                                        color: colorFromHex(
                                                            itemModal
                                                                .defaultProperties!
                                                                .color!
                                                                .textColor!),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        }),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      );
                    });
              }
            }));
  }
}
