import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthFirebaseRepository {
  Future<User> login({required String email, required String password});
  Future<User> loginWithGoogle();
  Future<User> loginWithFacebook();
  Future<User> register({
    required String email,
    required String password,
    required String fullName,
    required String gender,
    required String type,
    String? photoURL,
  });
  Future<String> checkAuthStatus();
  Future<void> logout();
}
