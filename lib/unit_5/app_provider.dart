import 'package:flutter/material.dart';

class AppProvider with ChangeNotifier {
  String? userName;
  String? token;

  void setUserName(String name) {
    userName = name;
    notifyListeners();
  }

  void getToken() {}

  void setToken(String token) {
    token = token;
    notifyListeners();
  }
}
