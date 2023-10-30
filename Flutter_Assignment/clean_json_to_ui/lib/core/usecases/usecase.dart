import 'package:clean_json_to_ui/core/error/failures.dart';
import 'package:clean_json_to_ui/features/home_screen/domain/entities/home_screen_data.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

// abstract class Usecase<Type> {
//   Future<Either<Failure, List<HomeScreenData>>> call();
// }
//
// class NoParams extends Equatable {
//   @override
//   // TODO: implement props
//   List<Object?> get props => throw UnimplementedError();
// }
abstract class Usecase<Type> {
  Future<Either<Failure, List<HomeScreenData>>> call();
}

abstract class AuthenticationUseCase<AuthenticationData, Params> {
  invoke(Params params);
}

// abstract class UseCase<Type, Params> {
//   Future<Either<Failure, Type>> call(Params params);
// }
