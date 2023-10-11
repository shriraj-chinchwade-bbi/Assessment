import 'package:clean_json_to_ui/features/authentication/data/model/authentication_model.dart';
import 'package:clean_json_to_ui/features/authentication/domain/repositories/authentication_repositoy.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';

class AuthenticationRegister {
  AuthenticationRegister(this.repository);
  final AuthenticationRepository repository;

  @override
  Future<Either<Failure, AuthenticationModel>> call() async {
    return await repository.authenticationRegister();
  }
}
