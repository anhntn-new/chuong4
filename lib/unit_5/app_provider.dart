import 'package:flutter/material.dart';

class AppModal with ChangeNotifier {
  String? userName;

  void setUserName(String name) {
    userName = name;
    notifyListeners();
  }
}
