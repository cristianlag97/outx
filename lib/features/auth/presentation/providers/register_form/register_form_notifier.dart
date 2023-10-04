part of features.auth.providers.register_form;

class RegisterNotifier extends StateNotifier<RegisterState> {
  RegisterNotifier({
    required this.registerUserCallback,
    required this.registerFirebaseUserCallback,
  }) : super(RegisterState());

  final Function(String, String, String) registerUserCallback;
  final Function({
    required String email,
    required String password,
    required String fullName,
    required String gender,
    required String type,
  }) registerFirebaseUserCallback;

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

  onSelectGender(String value) {
    state = state.copyWith(gender: value);
  }

  onSelectType(String value) {
    state = state.copyWith(type: value);
  }

  onSubmit() async {
    _touchEveryField();

    if (!state.isValid) return;
    await registerFirebaseUserCallback(
      email: state.email.value,
      password: state.password.value,
      fullName: state.fullName.value,
      gender: state.gender,
      type: state.type,
    );
    //TODO: LLamar funcionalidad de abajo en el controlador de firebase

    // await registerUserCallback(
    //   state.email.value,
    //   state.password.value,
    //   state.fullName.value,
    // );
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
