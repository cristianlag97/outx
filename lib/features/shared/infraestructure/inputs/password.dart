import 'package:formz/formz.dart';

// Define input validation errors
enum PasswordError {
  empty,
  less,
  format,
  more,
}

// Extend FormzInput and provide the input type and error type.
class Password extends FormzInput<String, PasswordError> {
  static final RegExp passwordRegExp = RegExp(
    r'(?:(?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$',
  );

  // Call super.pure to represent an unmodified form input.
  const Password.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const Password.dirty(String value) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == PasswordError.empty) return 'El campo es requerido';
    if (displayError == PasswordError.less) return 'Mínimo 8 caracteres';
    if (displayError == PasswordError.format) {
      return 'Debe de tener Mayúscula, letras y un número';
    }
    if (displayError == PasswordError.more) {
      return 'Pasaste el límite de carácteres';
    }
    // if()

    return null;
  }

  // Override validator to handle validating a given input value.
  @override
  PasswordError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return PasswordError.empty;
    if (value.length < 8) return PasswordError.less;
    if (!passwordRegExp.hasMatch(value)) return PasswordError.format;
    if (value.length > 100) return PasswordError.more;
    return null;
  }
}
