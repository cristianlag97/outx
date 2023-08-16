import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:outmap/features/auth/infraestructure/infraestructure.dart';
import 'package:outmap/features/shared/infraestructure/services/key_value_storage_service_impl.dart';

import '../../domain/domain.dart';

enum AuthStatus { checking, authenticated, notAuthenticated }

class AuthState {
  AuthState({
    this.authStatus = AuthStatus.checking,
    this.user,
    this.errorMessage = '',
  });

  final AuthStatus authStatus;
  final User? user;
  final String errorMessage;

  AuthState copyWith({
    AuthStatus? authStatus,
    User? user,
    String? errorMessage,
  }) =>
      AuthState(
        authStatus: authStatus ?? this.authStatus,
        user: user ?? this.user,
        errorMessage: errorMessage ?? this.errorMessage,
      );
}

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier({
    required this.authDataRepository,
    required this.keyValueStorageService,
  }) : super(AuthState()) {
    checkAuthStatus();
  }

  final AuthDataRepository authDataRepository;
  final KeyValueStorageServiceimpl keyValueStorageService;

  Future<void> loginUser(String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 500));

    try {
      final user = await authDataRepository.login(email, password);
      _setLoggerUser(user);
    } on CustomError catch (e) {
      logout(e.message);
    } catch (e) {
      logout('Error no controlado');
    }
  }

  void registerUser(String email, String password, String fullName) async {
    await Future.delayed(const Duration(milliseconds: 500));

    try {
      final user = await authDataRepository.register(email, password, fullName);
      _setLoggerUser(user);
    } on CustomError catch (e) {
      logout(e.message);
    } catch (e) {
      logout('Error no controlado');
    }
  }

  void checkAuthStatus() async {
    final token = await keyValueStorageService.getValue<String>('token');

    if (token == null) return logout();

    try {
      final user = await authDataRepository.checkAuthStatus(token);
      _setLoggerUser(user);
    } catch (e) {
      logout();
    }
  }

  void _setLoggerUser(User user) async {
    await keyValueStorageService.setKeyValue('token', user.token);
    state = state.copyWith(
      user: user,
      errorMessage: '',
      authStatus: AuthStatus.authenticated,
    );
  }

  Future<void> logout([String? errorMessage]) async {
    await keyValueStorageService.removeKey('token');
    state = state.copyWith(
      authStatus: AuthStatus.notAuthenticated,
      user: null,
      errorMessage: errorMessage,
    );
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final authRepository = AuthRepositoryImpl();
  final keyValueStorageService = KeyValueStorageServiceimpl();

  return AuthNotifier(
    authDataRepository: authRepository,
    keyValueStorageService: keyValueStorageService,
  );
});
