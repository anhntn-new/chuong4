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
}
