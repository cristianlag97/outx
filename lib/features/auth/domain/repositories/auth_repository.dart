import '../domain.dart';

abstract class AuthRepository {
  Future<UserEntity> login({required String email, required String password});
  Future<UserEntity> loginWithGoogle();
  Future<UserEntity> loginWithFacebook();
  Future<UserEntity> register(Map<String, dynamic> json);
  Future<UserEntity> checkAuthStatus(String token);
  Future<void> logout();
}
