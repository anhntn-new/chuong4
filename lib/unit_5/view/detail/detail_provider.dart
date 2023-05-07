import 'package:chuong4/unit_5/modal/movie_modal.dart';
import 'package:flutter/material.dart';

class DetailProvider with ChangeNotifier {
  bool isLoading = false;
  bool showMore = false;
  Movie? movie;

  void setIsLoading(bool loading) {
    isLoading = loading;
    notifyListeners();
  }
}
