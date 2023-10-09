part of features.auth.providers.login_form;

class LoginFormNotifier extends StateNotifier<LoginFormState> {
  LoginFormNotifier({
    required this.loginUserCallback,
    required this.loginFirebaseUserCallback,
    required this.keyValueStorageService,
  }) : super(LoginFormState()) {
    checkInRemember();
  }

  final Function(String, String) loginUserCallback;
  final KeyValueStorageServiceimpl keyValueStorageService;
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

  Future<void> checkInRemember() async {
    print('Entramos acá XD');
    try {
      final isRemember =
          await keyValueStorageService.getValue<bool>('isRemembreLogin');

      if (isRemember != null && isRemember) {
        final valueEmail =
            await keyValueStorageService.getValue<String>('emailLogin');
        final valuePassword =
            await keyValueStorageService.getValue<String>('passwordLogin');
        final newEmail = Email.dirty(valueEmail!);
        final newPassword = Password.dirty(valuePassword!);
        state = state.copyWith(
          isRemember: isRemember,
          email: newEmail,
          password: newPassword,
          isValid: Formz.validate([newEmail, newPassword]),
        );
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  onPasswordChanged(String value) {
    final newPassword = Password.dirty(value);
    state = state.copyWith(
      password: newPassword,
      isValid: Formz.validate([newPassword, state.email]),
    );
  }

  onChangeRemember(bool value) {
    state = state.copyWith(isRemember: value);

    if (value) {
      saveLogin();
    } else {
      removeLogin();
    }
  }

  saveLogin() async {
    print(
        'Guardamos data : ${state.email.value} -- ${state.password.value} -- ${state.isRemember}');
    await keyValueStorageService.setKeyValue('emailLogin', state.email.value);
    await keyValueStorageService.setKeyValue(
        'passwordLogin', state.password.value);
    await keyValueStorageService.setKeyValue(
        'isRemembreLogin', state.isRemember);
  }

  removeLogin() async {
    await keyValueStorageService.removeKey('emailLogin');
    await keyValueStorageService.removeKey('passwordLogin');
    await keyValueStorageService.removeKey('isRemembreLogin');
  }

  onChangeObscureText() {
    state = state.copyWith(isObscureText: !state.isObscureText);
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
