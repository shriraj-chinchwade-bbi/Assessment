import 'package:equatable/equatable.dart';

class AuthenticationEntity extends Equatable {
  String? email;
  String? password;
  String? name;

  AuthenticationEntity({this.email, this.password, this.name});

  @override
  // TODO: implement props
  List<Object?> get props => [email, password, name];
}
