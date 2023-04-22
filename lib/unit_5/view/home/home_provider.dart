import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  bool isLoading = false;

  void setIsLoading(bool loading) {
    isLoading = loading;
    notifyListeners();
  }
}
