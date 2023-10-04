import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/domain.dart' hide UserEntity;
import '../datasources/auth_firebase_datasource_impl.dart';

class AuthFirebaseRepositoryImpl extends AuthFirebaseRepository {
  AuthFirebaseRepositoryImpl({AuthFirebaseDataSource? authDataSource})
      : authDataSource = authDataSource ?? AuthFirebaseDatasourceImpl();

  final AuthFirebaseDataSource authDataSource;

  @override
  Future<String> checkAuthStatus() {
    return authDataSource.checkAuthStatus();
  }

  @override
  Future<void> logout() {
    return authDataSource.logout();
  }

  @override
  Future<User> login({required String email, required String password}) {
    return authDataSource.login(email: email, password: password);
  }

  @override
  Future<User> register(
      {required String email,
      required String password,
      required String fullName,
      required String gender,
      required String type,
      String? photoURL}) {
    return authDataSource.register(
      email: email,
      password: password,
      fullName: fullName,
      gender: gender,
      type: type,
    );
  }

  @override
  Future<User> loginWithFacebook() {
    return authDataSource.loginWithFacebook();
  }

  @override
  Future<User> loginWithGoogle() {
    return authDataSource.loginWithGoogle();
  }
}

//** Esto es lo mas comun AuthRepositoryImpl(this.authDataSource) y es para forzar a depender del dataSource(domain) y usarlo obligatoriamente/
//** La opción que estoy implementando ya es opcional y es que si lo traigo lo uso, sino uso la implementación del datasource(repository) o el datasourceImpl */
