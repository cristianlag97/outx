part of features.auth.providers.auth_firebase;

final authFirebaseProvider =
    StateNotifierProvider<AuthFirebaseNotifier, AuthFirebaseState>((ref) {
  return AuthFirebaseNotifier(AuthFirebaseRepositoryImpl());
});
