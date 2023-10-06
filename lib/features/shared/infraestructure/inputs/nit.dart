import 'package:formz/formz.dart';

enum NitError { empty, less, more }

class Nit extends FormzInput<String, NitError> {
  const Nit.pure() : super.pure('');
  const Nit.dirty(String value) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;
    if (displayError == NitError.empty) return 'El campo es requerido';
    if (displayError == NitError.less) return 'No tiene más de dos carácteres';
    if (displayError == NitError.more) return 'Pasaste el limite de carácteres';
    return null;
  }

  @override
  NitError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return NitError.empty;
    if (value.length <= 1) return NitError.less;
    if (value.length >= 9) return NitError.more;
    return null;
  }
}
