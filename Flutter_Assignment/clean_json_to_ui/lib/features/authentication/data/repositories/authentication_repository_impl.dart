import 'package:clean_json_to_ui/core/error/failures.dart';
import 'package:clean_json_to_ui/core/util/utility.dart';

import 'package:clean_json_to_ui/features/authentication/data/model/authentication_model.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/error/exception.dart';
import '../../domain/repositories/authentication_repositoy.dart';
import '../datasources/authentication_data_source.dart';

String? abc;

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  AuthenticationRepositoryImpl({
    required this.dataSource,
  });

  late final AuthenticationDataSource dataSource;

  @override
  Future<Either<Failure, AuthenticationModel>> authenticationLogin() {
    // TODO: implement authenticationLogin
    return validateData(emailController.text, passwordController.text);
  }

  @override
  Future<Either<Failure, AuthenticationModel>> authenticationRegister() {
    // TODO: implement authenticationRegister
    return _getAuthentication();
  }

  validateData(String inputEmail, String inputPassword) async {
    var obtainEmail = sharedprefrance.getString("email");
    var obtainName = sharedprefrance.getString("name");
    var obtainPassword = sharedprefrance.getString("password");

    int emailResultOffline = inputEmail.compareTo(obtainEmail!);
    int emailResultOnline = inputEmail.compareTo(login_credentails['email']);
    int passwordResultOffline = inputPassword.compareTo(obtainPassword!);
    int passwordResultOnline =
        inputPassword.compareTo(login_credentails['password']);
    if (inputEmail.isEmpty) {
      decision = false;
    } else if ((emailResultOffline == 0 && passwordResultOffline == 0) ||
        (emailResultOnline == 0 && passwordResultOnline == 0)) {
      decision = true;
    } else {
      decision = false;
    }
    return decision;
  }

  Future<Either<Failure, AuthenticationModel>> _getAuthentication() async {
    try {
      final localData = await dataSource.authenticationData();
      return Right(localData);
    } on CacheException {
      return Left(CacheFailure());
    }

    // return Right(login_credentails);
  }
}
