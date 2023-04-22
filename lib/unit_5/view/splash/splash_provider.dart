import 'package:flutter/material.dart';

class SplashProvider with ChangeNotifier {
  bool isLoading = false;
  String process = '';

  void setIsLoading(bool loading) {
    isLoading = loading;
    notifyListeners();
  }

  void setProcess(String value) {
    process = value;
    notifyListeners();
  }
}
