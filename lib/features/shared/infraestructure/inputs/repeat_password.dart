import 'package:formz/formz.dart';

import 'inputs.dart';

enum RepeatPasswordError { empty, isNotEqual }

class RepeatPassword extends FormzInput<String, RepeatPasswordError> {
  const RepeatPassword.pure([this.password = const Password.pure()])
      : super.pure('');
  const RepeatPassword.dirty(this.password, String value) : super.dirty(value);

  final Password password;

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == RepeatPasswordError.empty) {
      return 'El campo es requerido';
    }
    if (displayError == RepeatPasswordError.isNotEqual) {
      return 'No coindice con la constraseña';
    }

    return null;
  }

  @override
  RepeatPasswordError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return RepeatPasswordError.empty;
    if (value != password.value) return RepeatPasswordError.isNotEqual;
    return null;
  }
}
