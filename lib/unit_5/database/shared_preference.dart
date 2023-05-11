import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  static Future<void> setToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }

  static Future<String?> getToken() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      return token;
    } catch (e) {
      print('get token err -> ' + e.toString());
      return null;
    }
  }

  static Future<bool> removeToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.remove('token');
  }

  static Future<void> setToken2(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token2', token);
  }

  static Future<String?> getToken2() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token2');
      return token;
    } catch (e) {
      print('get token err -> ' + e.toString());
      return null;
    }
  }

  static void removeToken2() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token2');
  }

  static Future<void> setDueDate(String dueDate) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('dueDate', dueDate);
  }

  static Future<String?> getDueDate() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? dueDate = prefs.getString('dueDate');
      return dueDate;
    } catch (e) {
      print('get token err -> ' + e.toString());
      return null;
    }
  }

  static Future<void> setSession(String session) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('session', session);
  }

  static Future<String?> getSession() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? session = prefs.getString('session');
      return session;
    } catch (e) {
      print('get token err -> ' + e.toString());
      return null;
    }
  }
}
