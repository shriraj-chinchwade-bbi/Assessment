import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'guideline_modal.dart' as modal;
import 'package:collection/collection.dart';

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

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/temp.json');
    final data = await json.decode(response);
    modal.GuideLinesModal obj = modal.GuideLinesModal.fromJson(data[0]);
    print(obj);
    for (int i = 0; i < data.length; i++) {
      listGuideLineModal.add(modal.GuideLinesModal.fromJson(data[i]));
    }
    print(listGuideLineModal[0].sequenceNo);
    listGuideLineModal.sort(
        (a, b) => num.parse(a.sequenceNo!).compareTo(num.parse(b.sequenceNo!)));
    print(listGuideLineModal[0].sequenceNo);
    // setState(() {
    //   _items = data[0]["items"];
    // });
  }

  @override
  void initState() {
    readJson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Padding(
            padding: const EdgeInsets.all(5),
            child: ListView.builder(
                itemCount: listGuideLineModal.length,
                itemBuilder: (context, index) {
                  modal.GuideLinesModal guideLineModal =
                      listGuideLineModal[index];
                  return SizedBox(
                    height: 200,
                    width: 300,
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
                                return Row(
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
                                      color: colorFromHex(itemModal
                                          .defaultProperties!
                                          .color!
                                          .backgroundColor!),
                                      height: 100,
                                      width: 100,
                                      child: Text(
                                        '${itemModal.id!}\n${itemModal.tag!}',
                                        style: TextStyle(
                                          color: colorFromHex(itemModal
                                              .defaultProperties!
                                              .color!
                                              .textColor!),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }),
                        )
                      ],
                    ),
                  );
                })));
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
