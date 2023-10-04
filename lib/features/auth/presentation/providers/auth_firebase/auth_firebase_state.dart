part of features.auth.providers.auth_firebase;

enum AuthFirebaseStatus { checking, authenticated, notAuthenticated }

class AuthFirebaseState {
  AuthFirebaseState({
    this.authStatus = AuthFirebaseStatus.checking,
    this.user,
    this.errorMessage = '',
  });

  final AuthFirebaseStatus authStatus;
  final User? user;
  final String errorMessage;

  AuthFirebaseState copyWith({
    AuthFirebaseStatus? authStatus,
    User? user,
    String? errorMessage,
  }) =>
      AuthFirebaseState(
        authStatus: authStatus ?? this.authStatus,
        user: user ?? this.user,
        errorMessage: errorMessage ?? this.errorMessage,
      );
}
