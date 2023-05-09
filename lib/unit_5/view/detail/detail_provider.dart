import 'package:chuong4/enum/load_status.dart';
import 'package:chuong4/unit_5/modal/movie_modal.dart';
import 'package:chuong4/unit_5/services/services.dart';
import 'package:flutter/material.dart';

class DetailProvider with ChangeNotifier {
  LoadStatus isLoading = LoadStatus.initial;
  bool showMore = false;
  Movie? movie;

  void setIsLoading(LoadStatus status) {
    isLoading = status;
    notifyListeners();
  }

  Future<void> init(num id) async {
    isLoading = LoadStatus.loading;
    // notifyListeners();
    try{
      final result = await Services.getMovieDetail(id: id);
      if (result != null) {
        movie = result;
        Future.delayed(const Duration(seconds: 1),(){
          isLoading = LoadStatus.success;
          notifyListeners();
        });
      }
    }
    catch(e){
      isLoading = LoadStatus.failure;
      notifyListeners();
    }
  }
}
