part of 'app_cubit.dart';

class AppState extends Equatable {
  final UserModal? user;
  final LoadStatus fetchProfileStatus;
  final LoadStatus signOutStatus;

  const AppState({
    this.user,
    this.fetchProfileStatus = LoadStatus.initial,
    this.signOutStatus = LoadStatus.initial,
  });

  AppState copyWith({
    UserModal? user,
    LoadStatus? fetchProfileStatus,
    LoadStatus? signOutStatus,
  }) {
    return AppState(
      user: user ?? this.user,
      fetchProfileStatus: fetchProfileStatus ?? this.fetchProfileStatus,
      signOutStatus: signOutStatus ?? this.signOutStatus,
    );
  }

  AppState removeUser() {
    return AppState(
      user: user,
      fetchProfileStatus: fetchProfileStatus,
      signOutStatus: signOutStatus,
    );
  }

  @override
  List<Object?> get props => [
        user,
        fetchProfileStatus,
        signOutStatus,
      ];
}
