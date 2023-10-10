import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

String global_name = "abc";

class UserName with ChangeNotifier {
  void changeName(String new_name) {
    global_name = new_name;
    notifyListeners();
  }
}
