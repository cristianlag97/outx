part of features.auth.providers.login_form;

class LoginFormState {
  LoginFormState({
    this.isPosting = false,
    this.isFormPosted = false,
    this.isValid = false,
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.isObscureText = true,
    this.isRemember = false,
  });

  final bool isPosting;
  final bool isFormPosted;
  final bool isValid;
  final Email email;
  final Password password;
  final bool isObscureText;
  final bool isRemember;

  LoginFormState copyWith({
    bool? isPosting,
    bool? isFormPosted,
    bool? isValid,
    Email? email,
    Password? password,
    bool? isObscureText,
    bool? isRemember,
  }) =>
      LoginFormState(
        isPosting: isPosting ?? this.isPosting,
        isFormPosted: isFormPosted ?? this.isFormPosted,
        isValid: isValid ?? this.isValid,
        email: email ?? this.email,
        password: password ?? this.password,
        isObscureText: isObscureText ?? this.isObscureText,
        isRemember: isRemember ?? this.isRemember,
      );

  @override
  String toString() => '''LoginFormState:
  isPosting: $isPosting,
  isFormPosted: $isFormPosted,
  isValid: $isValid,
  email: $email,
   password: $password,
  ''';
}
