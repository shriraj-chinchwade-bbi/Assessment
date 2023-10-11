import 'package:clean_json_to_ui/features/authentication/domain/entities/authentication_entity.dart';

class AuthenticationModel extends AuthenticationEntity {
  AuthenticationModel({
    String? email,
    String? password,
    String? name,
  }) : super(email: email, password: password, name: name);
  factory AuthenticationModel.fromJson(Map<String, dynamic> json) {
    return AuthenticationModel(
      email: json['email'],
      password: json['password'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    data['name'] = this.name;
    return data;
  }
}
