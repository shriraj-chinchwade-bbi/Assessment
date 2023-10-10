import 'package:clean_json_to_ui/features/home_screen/domain/entities/home_screen_data.dart';
import 'package:dartz/dartz.dart';
import 'package:clean_json_to_ui/core/error/failures.dart';
import 'package:clean_json_to_ui/core/util/utility.dart';

import '../../data/model/home_screen_guideline_model.dart';

abstract class HomeScreenRepository {
  Future<Either<Failure, List<GuideLinesModal>>> homeScreenOfflineData(
      switchValue);
  Future<Either<Failure, List<GuideLinesModal>>> homeScreenOnlineData(
      switchValue);
}
