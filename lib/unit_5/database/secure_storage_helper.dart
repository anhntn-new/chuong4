import 'dart:convert';

import 'package:chuong4/unit_5/database/shared_preference.dart';
import 'package:chuong4/unit_5/modal/tokenModal.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageHelper {
  static const _apiTokenKey = '_apiTokenKey';

  final FlutterSecureStorage _storage;

  SecureStorageHelper._(this._storage);

  static final SecureStorageHelper _instance =
      SecureStorageHelper._(const FlutterSecureStorage());

  static SecureStorageHelper get instance => _instance;

  //Save token
  void saveToken(TokenModal token) async {
    await _storage.write(key: _apiTokenKey, value: jsonEncode(token.toJson()));
    SharedPreference.setToken(_apiTokenKey);
  }

  //Remove token
  Future<Future<bool>> removeToken() async {
    await _storage.delete(key: _apiTokenKey);
    return SharedPreference.removeToken();
  }

  //Get token
  Future<TokenModal?> getToken() async {
    try {
      final key = await SharedPreference.getToken();
      final tokenEncoded = await _storage.read(key: key ?? '');
      if (tokenEncoded == null) {
        return null;
      } else {
        return TokenModal.fromJson(
            jsonDecode(tokenEncoded) as Map<String, dynamic>);
      }
    } catch (e) {
      return null;
    }
  }
}
