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
  Future<Either<Failure, dynamic>> authenticationLogin() {
    // TODO: implement authenticationLogin
    return validateData(emailController.text, passwordController.text);
  }

  @override
  Future<Either<Failure, dynamic>> authenticationRegister() {
    // TODO: implement authenticationRegister
    return _regsiterNew();
  }

  Future<Either<Failure, dynamic>> validateData(
      String inputEmail, String inputPassword) async {
    try {
      login_credentails = await dataSource.authenticationDataRemote() as Map;
      try {
        var obtainEmail = sharedprefrance.getString("email");
        var obtainName = sharedprefrance.getString("name");
        var obtainPassword = sharedprefrance.getString("password");

        int emailResultOffline = inputEmail.compareTo(obtainEmail!);
        int passwordResultOffline = inputPassword.compareTo(obtainPassword!);
        int emailResultOnline =
            inputEmail.compareTo(login_credentails['email']);
        int passwordResultOnline =
            inputPassword.compareTo(login_credentails['password']);
        if ((emailResultOffline == 0 && passwordResultOffline == 0) ||
            (emailResultOnline == 0 && passwordResultOnline == 0)) {
          decision = true;
        } else {
          decision = false;
        }
      } catch (e) {
        var obtainEmail = login_credentails['email'];
        // var obtainName = sharedprefrance.getString("name");
        var obtainPassword = login_credentails['password'];

        int emailResultOffline = inputEmail.compareTo(obtainEmail!);
        int passwordResultOffline = inputPassword.compareTo(obtainPassword!);
        int emailResultOnline =
            inputEmail.compareTo(login_credentails['email']);
        int passwordResultOnline =
            inputPassword.compareTo(login_credentails['password']);
        if ((emailResultOffline == 0 && passwordResultOffline == 0) ||
            (emailResultOnline == 0 && passwordResultOnline == 0)) {
          decision = true;
        } else {
          decision = false;
        }
      }
      return Right(decision);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  Future<Either<Failure, dynamic>> _regsiterNew() async {
    try {
      var localData = await dataSource.authenticationDataLocal();
      return Right(localData);
    } on CacheException {
      return Left(CacheFailure());
    }

    // return Right(login_credentails);
  }
}
