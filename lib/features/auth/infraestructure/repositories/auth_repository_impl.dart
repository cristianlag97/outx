import '../../domain/domain.dart';
import '../infraestructure.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl({AuthDataSource? authDataSource})
      : authDataSource = authDataSource ?? AuthDatasourceImpl();

  final AuthDataSource authDataSource;

  @override
  Future<UserEntity> checkAuthStatus(String token) {
    return authDataSource.checkAuthStatus(token);
  }

  @override
  Future<UserEntity> login({required String email, required String password}) {
    return authDataSource.login(email: email, password: password);
  }

  @override
  Future<void> logout() {
    return authDataSource.logout();
  }

  @override
  Future<UserEntity> loginWithFacebook() {
    return authDataSource.loginWithFacebook();
  }

  @override
  Future<UserEntity> loginWithGoogle() {
    return authDataSource.loginWithGoogle();
  }

  @override
  Future<UserEntity> register(Map<String, dynamic> json) {
    return authDataSource.register(json);
  }
}

//** Esto es lo mas comun AuthRepositoryImpl(this.authDataSource) y es para forzar a depender del dataSource(domain) y usarlo obligatoriamente/
//** La opción que estoy implementando ya es opcional y es que si lo traigo lo uso, sino uso la implementación del datasource(repository) o el datasourceImpl */
