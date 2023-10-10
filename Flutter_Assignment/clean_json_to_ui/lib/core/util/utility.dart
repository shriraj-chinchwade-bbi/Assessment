import 'package:clean_json_to_ui/features/home_screen/data/datasources/home_screen_local_data_source.dart';
import 'package:clean_json_to_ui/features/home_screen/data/datasources/home_screen_remote_data_source.dart';
import 'package:clean_json_to_ui/features/home_screen/data/model/home_screen_guideline_model.dart'
    as modal;
import 'package:clean_json_to_ui/features/home_screen/domain/entities/home_screen_data.dart';

List<modal.GuideLinesModal> listGuideLineModal = [];
List<modal.GuideLinesModal> listGuideLineModalOnline = [];
List<modal.GuideLinesModal> listGuideLineModalOffline = [];
bool switchValue = false;

//true is for api
