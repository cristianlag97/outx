import 'package:dio/dio.dart';
import 'package:outmap/config/config.dart';

import '../../domain/domain.dart';
import '../infraestructure.dart';

class AuthDatasourceImpl extends AuthDataSource {
  @override
  Future<UserEntity> checkAuthStatus(String token) async {
    try {
      final response = await dio.get(
        checkAuthStatusApi,
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );

      final user = UserMapper.userJsonToEntity(response.data);
      return user;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw CustomError('Token incorrecto');
      }
      if (e.type == DioExceptionType.connectionTimeout) {
        throw CustomError('Revisar conexión a internet');
      }
      throw Exception();
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<UserEntity> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await dio.post(loginApi, data: {
        'email': email,
        'password': password,
      });

      final user = UserMapper.userJsonToEntity(response.data);
      return user;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw CustomError(
          e.response?.data['message'] ?? 'Credenciales incorrectas',
        );
      }
      if (e.type == DioExceptionType.connectionTimeout) {
        throw CustomError('Revisar conexión a internet');
      }
      throw Exception();
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<UserEntity> loginWithFacebook() {
    // TODO: implement loginWithFacebook
    throw UnimplementedError();
  }

  @override
  Future<UserEntity> loginWithGoogle() {
    // TODO: implement loginWithGoogle
    throw UnimplementedError();
  }

  @override
  Future<UserEntity> register(Map<String, dynamic> json) async {
    try {
      final response = await dio.post(registerApi, data: json);
      final user = UserMapper.userJsonToEntity(response.data);
      return user;
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        throw CustomError(
          e.response!.data['message'],
        );
      }
      if (e.type == DioExceptionType.connectionTimeout) {
        throw CustomError('Revisar conexión a internet');
      }
      throw Exception();
    } catch (e) {
      throw Exception();
    }
  }
}
