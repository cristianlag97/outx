import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:outmap/features/auth/presentation/providers/auth_provider.dart';

import '../../../shared/infraestructure/inputs/inputs.dart';

class RegisterState {
  RegisterState({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.repeatPassword = const RepeatPassword.pure(),
    this.fullName = const FullName.pure(),
    this.isFormPosted = false,
    this.isValid = false,
    this.isCompany = false,
  });

  final Email email;
  final Password password;
  final RepeatPassword repeatPassword;
  final FullName fullName;
  final bool isFormPosted;
  final bool isValid;
  final bool isCompany;

  RegisterState copyWith({
    Email? email,
    Password? password,
    RepeatPassword? repeatPassword,
    FullName? fullName,
    bool? isFormPosted,
    bool? isValid,
    bool? isCompany,
  }) =>
      RegisterState(
        email: email ?? this.email,
        password: password ?? this.password,
        repeatPassword: repeatPassword ?? this.repeatPassword,
        fullName: fullName ?? this.fullName,
        isFormPosted: isFormPosted ?? this.isFormPosted,
        isValid: isValid ?? this.isValid,
        isCompany: isCompany ?? this.isCompany,
      );

  @override
  String toString() => '''LoginFormState:
  isFormPosted: $isFormPosted,
  isValid: $isValid,
  email: $email,
   password: $password,
  repeatPassword: $repeatPassword,
  fullName: $fullName,
  isCompany: $isCompany,
  ''';
}

class RegisterNotifier extends StateNotifier<RegisterState> {
  RegisterNotifier({required this.registerUserCallback})
      : super(RegisterState());

  final Function(String, String, String) registerUserCallback;

  onEmailChange(String value) {
    final newEmail = Email.dirty(value);
    state = state.copyWith(
      email: newEmail,
      isValid: Formz.validate([
        newEmail,
        state.password,
        state.fullName,
        state.repeatPassword,
      ]),
    );
  }

  onPasswordChanged(String value) {
    final newPassword = Password.dirty(value);
    state = state.copyWith(
      password: newPassword,
      isValid: Formz.validate([
        newPassword,
        state.email,
        state.fullName,
        state.repeatPassword,
      ]),
    );
  }

  onFullNameChange(String value) {
    final newFullName = FullName.dirty(value);
    state = state.copyWith(
      fullName: newFullName,
      isValid: Formz.validate([
        newFullName,
        state.email,
        state.password,
        state.repeatPassword,
      ]),
    );
  }

  onRepeatPasswordChanged(String value) {
    final newRepeatPassword = RepeatPassword.dirty(state.password, value);
    state = state.copyWith(
      repeatPassword: newRepeatPassword,
      isValid: Formz.validate([
        newRepeatPassword,
        state.email,
        state.password,
        state.fullName,
      ]),
    );
  }

  onSubmit() async {
    _touchEveryField();

    if (!state.isValid) return;
    await registerUserCallback(
      state.email.value,
      state.password.value,
      state.fullName.value,
    );
  }

  onSelectcompay() async {
    state = state.copyWith(isCompany: true);
  }

  _touchEveryField() {
    final email = Email.dirty(state.email.value);
    final password = Password.dirty(state.password.value);
    final fullName = FullName.dirty(state.fullName.value);
    final repeatPassword =
        RepeatPassword.dirty(password, state.repeatPassword.value);

    state = state.copyWith(
      isFormPosted: true,
      email: email,
      password: password,
      repeatPassword: repeatPassword,
      fullName: fullName,
      isValid: Formz.validate([email, password, repeatPassword, fullName]),
    );
  }
}

final AutoDisposeStateNotifierProvider<RegisterNotifier, RegisterState>
    registerProvider =
    StateNotifierProvider.autoDispose<RegisterNotifier, RegisterState>(
        (AutoDisposeStateNotifierProviderRef<RegisterNotifier, RegisterState>
            ref) {
  final registerUserCallback = ref.watch(authProvider.notifier).registerUser;
  return RegisterNotifier(registerUserCallback: registerUserCallback);
});
