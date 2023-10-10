import 'package:clean_json_to_ui/core/usecases/usecase.dart';
import 'package:clean_json_to_ui/core/util/utility.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/error/failures.dart';
import '../../data/model/home_screen_guideline_model.dart';
import '../entities/home_screen_data.dart';
import '../repositories/home_screen_repository.dart';

class HomeScreenOnlineData implements Usecase<GuideLinesModal> {
  HomeScreenOnlineData(this.repository);
  final HomeScreenRepository repository;

  @override
  Future<Either<Failure, List<GuideLinesModal>>> call() async {
    return await repository.homeScreenOnlineData(switchValue);
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
