import 'dart:convert';
import 'package:clean_json_to_ui/features/authentication/data/model/authentication_model.dart';

import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../../../core/util/utility.dart';
import '../../../../main.dart';

abstract class AuthenticationDataSource {
  dynamic authenticationData();
}

class AuthenticationDataSourceImpl implements AuthenticationDataSource {
  AuthenticationDataSourceImpl({required this.sharedprefrance});
  late final SharedPreferences sharedprefrance;

  @override
  dynamic authenticationData() async {
    try {
      sharedprefrance.setString('email', emailController.text);
      sharedprefrance.setString('name', nameController.text);
      sharedprefrance.setString('password', passwordController.text);

      if (loginCredentialsApi.isEmpty) {
        final user_response = await http.read(Uri.parse(
            'https://s3.eu-west-1.amazonaws.com/bbi.appsdata.2013/for_development/user_details.json'));

        dynamic jsonResponseApi = json.decode(user_response);

        loginCredentialsApi =
            jsonResponseApi.map((data) => AuthenticationModel.fromJson(data));
        // global_name = login_credentailsApi!['name'];
        // global_name = "";
        // print(global_name);
        // print(loginCredentialsDisplay);
        print(loginCredentialsApi);
        return login_credentails = loginCredentialsApi;
      } else {
        // global_name = login_credentailsApi!['name'];
        // global_name = "";
        // print(global_name);
        return login_credentails = loginCredentialsApi;
      }
    } catch (e) {
      throw Exception("error:$e");
    }
  }
}
