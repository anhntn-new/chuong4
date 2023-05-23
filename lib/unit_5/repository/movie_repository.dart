import 'package:chuong4/unit_5/config/app_configs.dart';
import 'package:chuong4/unit_5/modal/arrayResponse.dart';
import 'package:chuong4/unit_5/modal/movie_modal.dart';
import 'package:chuong4/unit_5/network/api_client.dart';


abstract class MovieRepository {
  Future<ArrayResponseMovie> getMovieUpcoming({required int page});

  Future<ArrayResponseMovie> getMovieTrending({required int page});

  Future<Movie> getMovie(int id);
}

class MovieRepositoryImpl extends MovieRepository {
  ApiClient apiClient;

  MovieRepositoryImpl({required this.apiClient});

  @override
  Future<ArrayResponseMovie> getMovieUpcoming({required int page}) {
    return apiClient.getMoviesUpcoming(MovieAPIConfig.apiKey, page);

  }

  @override
  Future<ArrayResponseMovie> getMovieTrending({required int page}) {
    throw UnimplementedError();


  }

  @override
  Future<Movie> getMovie(int id) async {
    // return apiClient.getMovies(MovieAPIConfig.apiKey, page);
    return Movie();
  }
}
