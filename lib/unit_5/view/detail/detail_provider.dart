import 'package:flutter/material.dart';

class DetailProvider with ChangeNotifier {
  bool isLoading = false;

  void setIsLoading(bool loading) {
    isLoading = loading;
    notifyListeners();
  }
}
