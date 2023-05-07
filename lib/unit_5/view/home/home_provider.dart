import 'package:chuong4/unit_5/modal/movie_modal.dart';
import 'package:chuong4/unit_5/services/services.dart';
import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  bool isLoadingUp = false;
  bool isLoadingPopular = false;
  List<Movie>? listMoviePopular;
  List<Movie>? listMovieUpComing;

  Future<void> getListInit() async {
    isLoadingPopular = true;
    notifyListeners();
    List<Movie>? list = await Services.getMoviePopular();
    setListMoviePopular(list);
    isLoadingPopular = false;
    notifyListeners();

    isLoadingUp = true;
    notifyListeners();
    List<Movie>? listUp = await Services.getMovieUpcoming();
    setListMovieUp(listUp);
    isLoadingUp = false;
    notifyListeners();
  }

  void setListMoviePopular(List<Movie>? listMovie) {
    listMoviePopular = listMovie;
    notifyListeners();
  }

  void setListMovieUp(List<Movie>? listMovie) {
    listMovieUpComing = listMovie;
    notifyListeners();
  }
}
