import 'dart:convert';

import 'package:chuong4/unit_5/database/shared_preference.dart';
import 'package:chuong4/unit_5/modal/movie_modal.dart';
import 'package:chuong4/unit_5/services/api.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class Services {
  static const baseApi = 'api.themoviedb.org';
  static const apiKey = '078c8ee0cb3b928a7e657170b680d977';
  static const baseImg = 'https://image.tmdb.org/t/p/original';
  static const userName = 'anhntn';
  static const password = 'Anh150299';

  //c1042945be157a8718a3eb905aafffb80af7cdec
  static Future<String?> requestToken() async {
    final client = http.Client();

    try {
      var response = await client.get(
          Uri.https('$baseApi', '${Api.apiRequestToken}', {'api_key': apiKey}));
      print(response.body);
      var decodedResponse = jsonDecode(response.body) as Map;
      if (response != null && decodedResponse['success']) {
        SharedPreference.setToken(decodedResponse['request_token']);
        return decodedResponse['request_token'];
      }
      return null;
    } finally {
      client.close();
    }
  }

  static Future<String?> requestToken2(String token) async {
    final client = http.Client();

    try {
      var response = await client.post(
          Uri.https('$baseApi', '${Api.apiValidateLogin}', {'api_key': apiKey}),
          body: {
            'username': userName,
            'password': password,
            'request_token': token
          });
      print(response.body);
      response.body;
      var decodedResponse = jsonDecode(response.body) as Map;
      if (decodedResponse['success']) {
        SharedPreference.setToken(decodedResponse['request_token']);
        SharedPreference.setDueDate(decodedResponse['expires_at']);
        return decodedResponse['request_token'];
      } else if (decodedResponse['status_code'] == 17 ||
          decodedResponse['status_code'] == 33) {
        String? newToken = await requestToken();
        if (newToken != null && token != '') {
          return requestToken2(token);
        }
      }
    } catch (e) {
      print(e);
      return null;
    } finally {
      client.close();
    }
    return null;
  }

  static Future<String?> requestSession(String token) async {
    final client = http.Client();

    try {
      var response = await client.post(
          Uri.https(
            '$baseApi',
            '${Api.apiCreateSession}',
            {
              'api_key': apiKey,
            },
          ),
          body: {'request_token': token});
      response.body;
      var decodedResponse = jsonDecode(response.body) as Map;
      if (decodedResponse['success']) {
        SharedPreference.setSession(decodedResponse['session_id']);
        return decodedResponse['session_id'];
      } else if (decodedResponse['status_code'] == 17 ||
          decodedResponse['status_code'] == 33) {
        String? newToken = await requestToken();
        if (newToken != null && token != '') {
          return requestSession(token);
        }
      }
    } catch (e) {
      print(e);
      return null;
    } finally {
      client.close();
    }
    return null;
  }

  static Future<String> getUserInfo(String session) async {
    final client = http.Client();

    try {
      var response =
          await client.get(Uri.https('$baseApi', '${Api.apiGetUserInfo}', {
        'api_key': apiKey,
        'session_id': session,
      }));
      print(response.body);
      var decodedResponse = jsonDecode(response.body) as Map;
      decodedResponse['username'];
      if (decodedResponse['username'] != null) {
        return decodedResponse['username'];
      }
      return '';
    } catch (e) {
      print(e);
      return '';
    } finally {
      client.close();
    }
  }

  static Future<List<Movie>?> getMoviePopular(
      {String language = 'en-US', int page = 1, String? region}) async {
    final client = http.Client();

    try {
      var response = await client.get(Uri.https(baseApi, Api.apiMoviePopular,
          {'api_key': apiKey, 'page': page.toString()}));
      print(response.body);
      var decodedResponse = jsonDecode(response.body) as Map;
      decodedResponse['results'];
      if (!decodedResponse['results'].isEmpty) {
        List<Movie> listMovie = [];
        Movie movie = Movie();
        for (var e in (decodedResponse['results'] as List)) {
          {
            listMovie.add(
              Movie.fromJson(e),
            );
          }
        }
        return listMovie;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    } finally {
      client.close();
    }
  }

  static Future<List<Movie>?> getMovieUpcoming(
      {String language = 'en-US', int page = 1, String? region}) async {
    final client = http.Client();

    try {
      var response = await client.get(Uri.https(
        baseApi,
        Api.apiMovieUpComing,
        {
          'api_key': apiKey,
          'page': page.toString(),
        },
      ));
      print(response.body);
      var decodedResponse = jsonDecode(response.body) as Map;
      decodedResponse['results'];
      if (!decodedResponse['results'].isEmpty) {
        List<Movie> listMovie = [];
        Movie movie = Movie();
        for (var e in (decodedResponse['results'] as List)) {
          {
            listMovie.add(
              Movie.fromJson(e),
            );
          }
        }
        return listMovie;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    } finally {
      client.close();
    }
  }

  static Future<Movie?> getMovieDetail({
    required num id,
    String language = 'en-US',
  }) async {
    final client = http.Client();
    try {
      var response = await client.get(Uri.https(
        baseApi,
        '${Api.apiMovieDetail}$id',
        {
          'api_key': apiKey,
          'page': language,
        },
      ));
      print(response.body);
      var decodedResponse = jsonDecode(response.body) as Map<String, dynamic>;
      if (decodedResponse.isNotEmpty) {
        Movie movie = Movie.fromJson(decodedResponse);
        return movie;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    } finally {
      client.close();
    }
  }

  static Future<bool> checkLogin() async {
    String? token2 = await SharedPreference.getToken2();
    if ((token2 != null) && token2 != '') {
      String? dueDate = await SharedPreference.getDueDate();
      if ((dueDate != null) && dueDate != '') {
        DateTime date = DateFormat("yyyy-MM-dd HH:mm:ss").parse(dueDate, true);
        bool compare = date.isAfter(DateTime.now());
        return compare;
      }
      return false;
    } else {
      return false;
    }
  }
}
