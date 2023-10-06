import 'package:formz/formz.dart';

enum CedulaError { empty, less, more }

class Cedula extends FormzInput<String, CedulaError> {
  const Cedula.pure() : super.pure('');
  const Cedula.dirty(String value) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == CedulaError.empty) {
      return 'El campo es requerido';
    }
    if (displayError == CedulaError.less) {
      return 'No tiene mas de dos caracter';
    }
    if (displayError == CedulaError.more) {
      return 'Pasaste el límite de carácteres';
    }

    return null;
  }

  @override
  CedulaError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) {
      return CedulaError.empty;
    }
    if (value.length <= 1) return CedulaError.less;
    if (value.length >= 20) return CedulaError.more;
    return null;
  }
}
