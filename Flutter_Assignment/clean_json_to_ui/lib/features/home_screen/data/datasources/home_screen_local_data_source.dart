import 'package:clean_json_to_ui/features/home_screen/data/model/home_screen_guideline_model.dart';
import 'package:clean_json_to_ui/core/util/utility.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/services.dart';

abstract class HomeScreenLocalDataSource {
  Future<List<GuideLinesModal>> homeScreenLocalData();
}

class HomeScreenLocalDataSourceImpl implements HomeScreenLocalDataSource {
  HomeScreenLocalDataSourceImpl();

  @override
  Future<List<GuideLinesModal>> homeScreenLocalData() async {
    try {
      if (listGuideLineModalOffline.isEmpty) {
        final String response = await rootBundle.loadString('assets/temp.json');
        final data = await json.decode(response);
        // modal.GuideLinesModal obj = modal.GuideLinesModal.fromJson(data[0]);
        // print(obj);
        for (int i = 0; i < data.length; i++) {
          listGuideLineModalOffline.add(GuideLinesModal.fromJson(data[i]));
        }
        // print(listGuideLineModal[0].sequenceNo);
        listGuideLineModalOffline.sort((a, b) =>
            num.parse(a.sequenceNo!).compareTo(num.parse(b.sequenceNo!)));
        // print(listGuideLineModal[0].sequenceNo);
        // setState(() {
        //   _items = data[0]["items"];
        // });
        print("local data used");
        return listGuideLineModal = listGuideLineModalOffline;
      } else {
        return listGuideLineModal = listGuideLineModalOffline;
      }
    } catch (e) {
      throw Exception("error:$e");
    }
  }
}
