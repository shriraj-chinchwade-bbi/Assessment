import 'package:clean_json_to_ui/core/util/utility.dart';
import 'package:clean_json_to_ui/features/home_screen/data/model/home_screen_guideline_model.dart';
import 'package:clean_json_to_ui/features/home_screen/domain/repositories/home_screen_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:clean_json_to_ui/core/usecases/usecase.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/util/utility.dart';
import '../entities/home_screen_data.dart';
import 'package:clean_json_to_ui/core/util/utility.dart';

class HomeScreenOfflineData implements Usecase<GuideLinesModal> {
  HomeScreenOfflineData(this.repository);
  final HomeScreenRepository repository;

  @override
  Future<Either<Failure, List<GuideLinesModal>>> call() async {
    return await repository.homeScreenOfflineData(switchValue);
  }
}

// class Params extends Equatable {
//   final bool switchValue;
//
//   @override
//   Params({required this.switchValue});
//   // TODO: implement props
//   List<Object?> get props => throw UnimplementedError();
// }
