import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  static Future<void> setToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token_for_db', token);
  }

  static Future<String?> getToken() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token_for_db');
      return token;
    } catch (e) {
      print('get token_for_db err -> ' + e.toString());
      return null;
    }
  }

  static Future<bool> removeToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.remove('token_for_db');
  }


  static Future<void> setSessionAccessDB(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('session_for_db', token);
  }

  static Future<String?> getSessionAccessDB() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('session_for_db');
      return token;
    } catch (e) {
      print('get session_for_db err -> ' + e.toString());
      return null;
    }
  }

  static Future<bool> removeSessionAccessDB() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.remove('session_for_db');
  }


  static Future<void> setSe(String token) async {
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
