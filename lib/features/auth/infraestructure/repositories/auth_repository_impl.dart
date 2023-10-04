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
  Future<UserEntity> login(String email, String password) {
    return authDataSource.login(email, password);
  }

  @override
  Future<UserEntity> register(String email, String password, String fullName) {
    return authDataSource.register(email, password, fullName);
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }
}

//** Esto es lo mas comun AuthRepositoryImpl(this.authDataSource) y es para forzar a depender del dataSource(domain) y usarlo obligatoriamente/
//** La opción que estoy implementando ya es opcional y es que si lo traigo lo uso, sino uso la implementación del datasource(repository) o el datasourceImpl */
