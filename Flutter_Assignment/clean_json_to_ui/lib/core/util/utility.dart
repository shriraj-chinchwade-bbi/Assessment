import 'package:clean_json_to_ui/features/home_screen/data/datasources/home_screen_local_data_source.dart';
import 'package:clean_json_to_ui/features/home_screen/data/datasources/home_screen_remote_data_source.dart';
import 'package:clean_json_to_ui/features/home_screen/data/model/home_screen_guideline_model.dart'
    as modal;
import 'package:clean_json_to_ui/features/home_screen/domain/entities/home_screen_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<modal.GuideLinesModal> listGuideLineModal = [];
List<modal.GuideLinesModal> listGuideLineModalOnline = [];
List<modal.GuideLinesModal> listGuideLineModalOffline = [];
bool switchValue = false;
String global_name = "globaltoremove";
late SharedPreferences sharedprefrance;

//authentication variables

bool boolVal = false;
bool? boolApi;
bool? decision;
dynamic login_credentails = {};
dynamic loginCredentialsApi = {};
final nameController = TextEditingController();
final emailController = TextEditingController();
final passwordController = TextEditingController();
String? finalEmail;
String? finalPassword;
String? finalName;
