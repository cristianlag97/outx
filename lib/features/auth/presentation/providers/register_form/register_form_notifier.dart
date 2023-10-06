part of features.auth.providers.register_form;

class RegisterNotifier extends StateNotifier<RegisterState> {
  RegisterNotifier({
    required this.registerUserCallback,
    required this.registerFirebaseUserCallback,
  }) : super(RegisterState());

  final Function(Map<String, dynamic> json) registerUserCallback;
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
        state.fullNameCompany,
        state.nit,
        state.businessName,
        state.cedula,
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
        state.fullNameCompany,
        state.nit,
        state.businessName,
        state.cedula,
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
        state.fullNameCompany,
        state.nit,
        state.businessName,
        state.cedula,
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
        state.fullNameCompany,
        state.nit,
        state.businessName,
        state.cedula,
      ]),
    );
  }

  onFullNameCompanyChange(String value) {
    final newFullNameCompany = FullNameCompany.dirty(value);
    state = state.copyWith(
      fullNameCompany: newFullNameCompany,
      isValid: Formz.validate([
        newFullNameCompany,
        state.fullName,
        state.email,
        state.password,
        state.repeatPassword,
        state.nit,
        state.businessName,
        state.cedula,
      ]),
    );
  }

  onNitChange(String value) {
    final newNit = Nit.dirty(value);
    state = state.copyWith(
      nit: newNit,
      isValid: Formz.validate([
        newNit,
        state.fullName,
        state.email,
        state.password,
        state.repeatPassword,
        state.fullNameCompany,
        state.businessName,
        state.cedula,
      ]),
    );
  }

  onBusinessNameChange(String value) {
    final newBusinessName = BusinessName.dirty(value);
    state = state.copyWith(
      businessName: newBusinessName,
      isValid: Formz.validate([
        newBusinessName,
        state.fullNameCompany,
        state.fullName,
        state.email,
        state.password,
        state.repeatPassword,
        state.nit,
        state.cedula,
      ]),
    );
  }

  onCedulaChange(String value) {
    final newCedula = Cedula.dirty(value);
    state = state.copyWith(
      cedula: newCedula,
      isValid: Formz.validate([
        newCedula,
        state.fullNameCompany,
        state.fullName,
        state.email,
        state.password,
        state.repeatPassword,
        state.nit,
        state.businessName
      ]),
      // newBusinessName,
    );
  }

  onSelectGender(String value) {
    state = state.copyWith(gender: value);
  }

  onSelectType(String value) {
    state = state.copyWith(type: value);
  }

  onSelectCategory(String value) {
    state = state.copyWith(category: value);
  }

  onSubmit() async {
    Map<String, dynamic> sendData = {};
    _touchEveryField();

    if (!state.isValid) return;
    //TODO: Funcionalidad Firebase
    // await registerFirebaseUserCallback(
    //   email: state.email.value,
    //   password: state.password.value,
    //   fullName: state.fullName.value,
    //   gender: state.gender,
    //   type: state.type,
    // );
    if (state.isCompany) {
      sendData = <String, dynamic>{
        "fullName": state.fullName.value,
        "email": state.email.value,
        "gender": state.gender,
        "password": state.password.value,
        "isCompany": state.isCompany,
        "fullNameCompany": state.fullNameCompany.value,
        "nit": state.nit.value,
        "reasonSocial": state.businessName.value,
        "cedula": state.cedula.value,
        "category": state.category,
      };
    } else {
      sendData = <String, dynamic>{
        "fullName": state.fullName.value,
        "email": state.email.value,
        "gender": state.gender,
        "password": state.password.value,
        "isCompany": state.isCompany
      };
    }
    await registerUserCallback(sendData);
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
