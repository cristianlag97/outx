import 'package:formz/formz.dart';

enum FullNameError { empty, less }

class FullName extends FormzInput<String, FullNameError> {
  const FullName.pure() : super.pure('');
  const FullName.dirty(String value) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == FullNameError.empty) return 'El campo es requerido';
    if (displayError == FullNameError.less) {
      return 'No tiene mas de dos caracter';
    }

    return null;
  }

  @override
  FullNameError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return FullNameError.empty;
    if (value.length <= 1) return FullNameError.less;
    return null;
  }
}
