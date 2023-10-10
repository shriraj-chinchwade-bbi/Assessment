import 'package:clean_json_to_ui/features/home_screen/data/model/home_screen_guideline_model.dart';
import 'package:clean_json_to_ui/core/util/utility.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

abstract class HomeScreenRemoteDataSource {
  Future<List<GuideLinesModal>> homeScreenRemoteData();
}

class HomeScreenRemoteDataSourceImpl implements HomeScreenRemoteDataSource {
  HomeScreenRemoteDataSourceImpl();

  @override
  Future<List<GuideLinesModal>> homeScreenRemoteData() async {
    try {
      if (listGuideLineModalOnline.isEmpty) {
        // List<modal.GuideLinesModal> listGuideLineModalOnline = [];

        final response = await http.read(Uri.parse(
            'https://s3.eu-west-1.amazonaws.com/bbi.appsdata.2013/for_development/home_screen.json'));
        final List<dynamic> jsonResponse = json.decode(response);
        listGuideLineModalOnline =
            jsonResponse.map((data) => GuideLinesModal.fromJson(data)).toList();

        print("api fetched");
        return listGuideLineModal = listGuideLineModalOnline;
      } else {
        return listGuideLineModal = listGuideLineModalOnline;
      }
      // return json.decode(response);
    } catch (e) {
      throw Exception("error:$e");
    }
  }
}
// Future<List<modal.GuideLinesModal>> readJsonOnline() async {
//
// }
