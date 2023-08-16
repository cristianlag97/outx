import '../../domain/domain.dart';
import '../infraestructure.dart';

class AuthRepositoryImpl extends AuthDataRepository {
  AuthRepositoryImpl({AuthDataSource? authDataSource})
      : authDataSource = authDataSource ?? AuthDatasourceImpl();

  final AuthDataSource authDataSource;

  @override
  Future<User> checkAuthStatus(String token) {
    return authDataSource.checkAuthStatus(token);
  }

  @override
  Future<User> login(String email, String password) {
    return authDataSource.login(email, password);
  }

  @override
  Future<User> register(String email, String password, String fullName) {
    return authDataSource.register(email, password, fullName);
  }
}

//** Esto es lo mas comun AuthRepositoryImpl(this.authDataSource) y es para forzar a depender del dataSource(domain) y usarlo obligatoriamente/
//** La opción que estoy implementando ya es opcional y es que si lo traigo lo uso, sino uso la implementación del datasource(repository) o el datasourceImpl */
