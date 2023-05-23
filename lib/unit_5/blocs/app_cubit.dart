import 'package:chuong4/enum/load_status.dart';
import 'package:chuong4/unit_5/database/secure_storage_helper.dart';
import 'package:chuong4/unit_5/modal/sessionModal.dart';
import 'package:chuong4/unit_5/modal/tokenModal.dart';
import 'package:chuong4/unit_5/modal/user_modal.dart';
import 'package:chuong4/unit_5/view/logger.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'app_state.dart';

class AppCubit extends Cubit<AppState> {


  AppCubit() : super(const AppState());

  void fetchProfile() {
    emit(state.copyWith(fetchProfileStatus: LoadStatus.loading));
  }

  void updateProfile(UserModal user) {
    emit(state.copyWith(user: user));
  }

  Future<SessionModal?> signIn(String username, String password) async {

    await Future.delayed(const Duration(seconds: 2));
    return SessionModal(
        success: true, sessionId: '');
  }

  ///Sign Out
  void signOut() async {
    emit(state.copyWith(signOutStatus: LoadStatus.loading));
    try {
      await Future.delayed(const Duration(seconds: 2));
      await SecureStorage.instance.removeToken();
      emit(state.removeUser().copyWith(
            signOutStatus: LoadStatus.success,
          ));
    } catch (e) {
      logger.e(e);
      emit(state.copyWith(signOutStatus: LoadStatus.failure));
    }
  }

}
