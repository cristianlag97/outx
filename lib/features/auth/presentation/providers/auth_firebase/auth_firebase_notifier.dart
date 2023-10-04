part of features.auth.providers.auth_firebase;

class AuthFirebaseNotifier extends StateNotifier<AuthFirebaseState> {
  final AuthFirebaseRepository authFirebaseRepository;
  AuthFirebaseNotifier(this.authFirebaseRepository)
      : super(AuthFirebaseState()) {
    checkAuthStatusFirebase();
  }

  Future<void> firebaseLogout([String? errorMessage]) async {
    await authFirebaseRepository.logout();
    state = state.copyWith(
      authStatus: AuthFirebaseStatus.notAuthenticated,
      user: null,
      errorMessage: errorMessage,
    );
  }

  Future<void> loginFirebaseUser({
    required String email,
    required String password,
  }) async {
    await authFirebaseRepository.login(email: email, password: password);
  }

  void checkAuthStatusFirebase() async {
    await authFirebaseRepository.checkAuthStatus();
  }

  void registerFirebase({
    required String email,
    required String password,
    required String fullName,
    required String gender,
    required String type,
  }) async {
    await Future.delayed(const Duration(milliseconds: 500));
    try {
      final user = await authFirebaseRepository.register(
        email: email,
        password: password,
        fullName: fullName,
        gender: gender,
        type: type,
      );
      print('==> user2: $user');
    } on CustomError catch (e) {
      firebaseLogout(e.message);
    } catch (e) {
      firebaseLogout('Error no controlado');
    }
  }

  void signInWithGoogle() async {
    try {
      final user = await authFirebaseRepository.loginWithGoogle();
      print('print desde el notifier: $user');
    } on CustomError catch (e) {
      debugPrint('Error: ${e.message}');
      throw firebaseLogout(e.message);
    } catch (e) {
      debugPrint('Error no controlado: $e');
      throw firebaseLogout('Error no controlado');
    }
  }

  Future<User?> signInWithFacebook() async {
    try {
      final user = await authFirebaseRepository.loginWithFacebook();
      print('print desde el notifier: $user');
      return user;
    } on CustomError catch (e) {
      debugPrint('Error: ${e.message}');
      throw firebaseLogout(e.message);
    } catch (e) {
      debugPrint('Error no controlado: $e');
      throw firebaseLogout('Error no controlado');
    }
  }
}
