import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clean_json_to_ui/features/home_screen/domain/entities/home_screen_data.dart';
import 'package:clean_json_to_ui/features/home_screen/domain/usecases/home_screen_offline_data.dart';
import 'package:clean_json_to_ui/features/home_screen/domain/usecases/home_screen_online_data.dart';
import 'package:meta/meta.dart';

import '../../../../core/util/utility.dart';
import '../../data/model/home_screen_guideline_model.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  late HomeScreenOfflineData homeScreenOfflineData;
  late HomeScreenOnlineData homeScreenOnlineData;
  HomeScreenBloc(
      {required this.homeScreenOnlineData, required this.homeScreenOfflineData})
      : super(HomeScreenInitial()) {
    on<HomeScreenDataEvent>((event, emit) => (HomeScreenInitial()));
  }
  Future<List<GuideLinesModal>> callDecider() async {
    if (switchValue == false) {
      await homeScreenOfflineData();
    }

    if (switchValue == true) {
      await homeScreenOnlineData();
    }
    return listGuideLineModal;
  }

  loadHomeScreen() {
    add(HomeScreenDataEvent());
  }
}
