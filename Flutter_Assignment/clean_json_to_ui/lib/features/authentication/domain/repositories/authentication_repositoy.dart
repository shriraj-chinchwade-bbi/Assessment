import 'package:clean_json_to_ui/features/authentication/data/model/authentication_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, dynamic>> authenticationLogin();
  Future<Either<Failure, dynamic>> authenticationRegister();
}
