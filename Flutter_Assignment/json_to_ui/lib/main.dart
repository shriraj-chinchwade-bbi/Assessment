import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'guideline_modal.dart' as modal;
// import 'package:collection/collection.dart';

Color colorFromHex(String hexColor) {
  return Color(int.parse(hexColor.replaceAll("#", "0xff")));
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Json_to_UI',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Json to UI'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<modal.GuideLinesModal> listGuideLineModal = [];

  // Fetch content from the json file

  Future<List<modal.GuideLinesModal>> readJson() async {
    await Future.delayed(const Duration(seconds: 2));

    List<modal.GuideLinesModal> listGuideLineModal = [];

    try {
      final String response = await rootBundle.loadString('assets/temp.json');
      final data = await json.decode(response);
      // modal.GuideLinesModal obj = modal.GuideLinesModal.fromJson(data[0]);
      // print(obj);
      for (int i = 0; i < data.length; i++) {
        listGuideLineModal.add(modal.GuideLinesModal.fromJson(data[i]));
      }
      // print(listGuideLineModal[0].sequenceNo);
      listGuideLineModal.sort((a, b) =>
          num.parse(a.sequenceNo!).compareTo(num.parse(b.sequenceNo!)));
      // print(listGuideLineModal[0].sequenceNo);
      // setState(() {
      //   _items = data[0]["items"];
      // });
      return listGuideLineModal;
    } catch (e) {
      throw Exception("error:$e");
    }
  }

  // @override
  // void initState() {
  //   readJson();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: FutureBuilder<List<modal.GuideLinesModal>>(
            future: readJson(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                    child:
                        CircularProgressIndicator()); // Show a loading indicator while data is being fetched.
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

// class GuidelineCard extends StatefulWidget {
//   const GuidelineCard({super.key});
//   @override
//   State<StatefulWidget> createState() {
//     // TODO: implement createState
//     return _ScreenState();
//   }
// }
//
// class _ScreenState extends State<GuidelineCard> {
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Container(
//       height: 500,
//       width: 400,
//       child: ListView.builder(
//           scrollDirection: Axis.vertical,
//           itemBuilder: (context, index) {
//             modal.GuideLinesModal obj1 = modal.GuideLinesModal.fromJson(data[index]);
//           }),
//     );
//   }
// }
