part of features.auth.providers.auth;

enum AuthStatus { checking, authenticated, notAuthenticated }

class AuthState {
  AuthState({
    this.authStatus = AuthStatus.checking,
    this.user,
    this.errorMessage = '',
  });

  final AuthStatus authStatus;
  final UserEntity? user;
  final String errorMessage;

  AuthState copyWith({
    AuthStatus? authStatus,
    UserEntity? user,
    String? errorMessage,
  }) =>
      AuthState(
        authStatus: authStatus ?? this.authStatus,
        user: user ?? this.user,
        errorMessage: errorMessage ?? this.errorMessage,
      );
}
