import 'package:chuong4/unit_5/modal/arrayResponse.dart';
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
  Future<TokenModal> getToken2(@Body() Map<String, String> body);
  @POST("/3/authentication/token/validate_with_login")
  Future<TokenModal> getSession(@Body() Map<String, String> body);

  @POST("/logout")
  Future<dynamic> signOut(@Body() Map<String, dynamic> body);

  /// Movie
  @GET("/3/movie/popular")
  Future<ResponseMovie> getMoviesPopular(
    @Query('api_key') String apiKey,
    @Query('language') String language,
    @Query('page') int page,
  );
}
