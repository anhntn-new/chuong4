import 'package:chuong4/unit_5/modal/movie_modal.dart';
import 'package:chuong4/unit_5/services/services.dart';
import 'package:flutter/material.dart';

class DetailProvider with ChangeNotifier {
  bool isLoading = false;
  bool showMore = false;
  Movie? movie;

  void setIsLoading(bool loading) {
    isLoading = loading;
    notifyListeners();
  }

  Future<bool> init(num id) async {
    isLoading = true;
    notifyListeners();
    Future.delayed(const Duration(seconds: 5), () {
      print('One second has passed.'); // Prints after 1 second.
    });
    movie = await Services.getMovieDetail(id: id);
    isLoading = false;
    notifyListeners();
    return true;

    // setState(() {
    //   movie = mv;
    // });
  }
}
