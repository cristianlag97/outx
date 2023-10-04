part of features.auth.providers.register_form;

class RegisterState {
  RegisterState({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.repeatPassword = const RepeatPassword.pure(),
    this.fullName = const FullName.pure(),
    this.isFormPosted = false,
    this.isValid = false,
    this.isCompany = false,
    this.gender = 'Hombre',
    this.type = 'Persona',
  });

  final Email email;
  final Password password;
  final RepeatPassword repeatPassword;
  final FullName fullName;
  final bool isFormPosted;
  final bool isValid;
  final bool isCompany;
  final String gender;
  final String type;

  RegisterState copyWith({
    Email? email,
    Password? password,
    RepeatPassword? repeatPassword,
    FullName? fullName,
    bool? isFormPosted,
    bool? isValid,
    bool? isCompany,
    String? gender,
    String? type,
  }) =>
      RegisterState(
        email: email ?? this.email,
        password: password ?? this.password,
        repeatPassword: repeatPassword ?? this.repeatPassword,
        fullName: fullName ?? this.fullName,
        isFormPosted: isFormPosted ?? this.isFormPosted,
        isValid: isValid ?? this.isValid,
        isCompany: isCompany ?? this.isCompany,
        gender: gender ?? this.gender,
        type: type ?? this.type,
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
  gender: $gender,
  type: $type,
  ''';
}
