import 'package:clean_json_to_ui/features/authentication/data/model/authentication_model.dart';
import 'package:clean_json_to_ui/features/authentication/domain/repositories/authentication_repositoy.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';

class AuthenticationLogin {
  AuthenticationLogin(this.repository);
  final AuthenticationRepository repository;

  @override
  invoke() async {
    return await repository.authenticationLogin();
  }

  Future<Either<Failure, bool>> getLoginValueToUsecaseFile(
      String email, String password) async {
    return await repository.callAuthenticationForLogin(email, password);
  }
}
