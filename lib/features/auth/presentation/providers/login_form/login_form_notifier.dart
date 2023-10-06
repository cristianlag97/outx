part of features.auth.providers.login_form;

class LoginFormNotifier extends StateNotifier<LoginFormState> {
  LoginFormNotifier({
    required this.loginUserCallback,
    required this.loginFirebaseUserCallback,
  }) : super(LoginFormState());

  final Function(String, String) loginUserCallback;
  final Function({
    required String email,
    required String password,
  }) loginFirebaseUserCallback;

  onEmailChange(String value) {
    final newEmail = Email.dirty(value);
    state = state.copyWith(
      email: newEmail,
      isValid: Formz.validate([newEmail, state.password]),
    );
  }

  onPasswordChanged(String value) {
    final newPassword = Password.dirty(value);
    state = state.copyWith(
      password: newPassword,
      isValid: Formz.validate([newPassword, state.email]),
    );
  }

  onformSubmit() async {
    _touchEveryField();

    if (!state.isValid) return;

    state = state.copyWith(isPosting: true);

    // await loginFirebaseUserCallback(
    //   email: state.email.value,
    //   password: state.password.value,
    // );
    await loginUserCallback(state.email.value, state.password.value);
    state = state.copyWith(isPosting: false);
  }

  _touchEveryField() {
    final email = Email.dirty(state.email.value);
    final password = Password.dirty(state.password.value);

    state = state.copyWith(
      isFormPosted: true,
      email: email,
      password: password,
      isValid: Formz.validate([email, password]),
    );
  }
}
