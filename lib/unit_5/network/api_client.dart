import 'package:chuong4/unit_5/modal/arrayResponse.dart';
import 'package:chuong4/unit_5/modal/request_body/request_session.dart';
import 'package:chuong4/unit_5/modal/request_body/request_token2.dart';
import 'package:chuong4/unit_5/modal/tokenModal.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  ///User
  @GET("/3/authentication/token/new")
  Future<TokenModal> getToken1(
    @Query('api_key') String apiKey,
  );

  @POST("/3/authentication/token/validate_with_login")
  Future<TokenModal> getToken2( @Query('api_key') String apiKey, @Body() RequestToken2 body);


  @POST("/3/authentication/token/validate_with_login")
  Future<TokenModal> getSession(@Query('api_key') String apiKey,@Body() RequestSession body);

  @POST("/3/authentication/session")
  Future<dynamic> signOut( @Body() Map<String, dynamic> body);

  /// Movie
  @GET("/3/movie/popular")
  Future<ArrayResponseMovie> getMoviesPopular({
    @Query('api_key') String apiKey,
    @Query('language') String? language,
    @Query('page') int page,
  });

  @GET("/3/trending/movie/")
  Future<ArrayResponseMovie> getMoviesTrending(
      {
    @Query('api_key') String apiKey,
    @Query('language') String? language,
    @Query('time_window') String timeWindow, //String 6h / day / week
    @Query('page') int page,
  });

  @GET("/3/movie/upcoming")
  Future<ArrayResponseMovie> getMoviesUpcoming({
    @Query('api_key') String apiKey,
    @Query('language') String? language,
    @Query('page') int page,
  });


}
