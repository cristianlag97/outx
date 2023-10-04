part of features.auth.providers.auth;

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final authRepository = AuthRepositoryImpl();
  final keyValueStorageService = KeyValueStorageServiceimpl();

  return AuthNotifier(
    authDataRepository: authRepository,
    keyValueStorageService: keyValueStorageService,
  );
});
