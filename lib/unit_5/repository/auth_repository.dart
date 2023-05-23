import 'package:chuong4/unit_5/database/secure_storage_helper.dart';
import 'package:chuong4/unit_5/modal/sessionModal.dart';
import 'package:chuong4/unit_5/network/api_client.dart';

abstract class AuthRepository {
  Future<SessionModal?> getSession();

  Future<void> saveSession(SessionModal session);

  Future<void> removeToken();

  Future<SessionModal?> signIn(String username, String password);
}

class AuthRepositoryImpl extends AuthRepository {
  ApiClient apiClient;

  AuthRepositoryImpl({required this.apiClient});


  @override
  Future<SessionModal?> getSession() async {
    return await SecureStorage.instance.getSession();
  }

  @override
  Future<void> removeToken() {
    // TODO: implement removeToken
    throw UnimplementedError();
  }

  @override
  Future<void> saveSession(SessionModal session) {
    // TODO: implement saveSession
    throw UnimplementedError();
  }

  @override
  Future<SessionModal?> signIn(String username, String password) {
    // TODO: implement signIn
    throw UnimplementedError();
  }

}