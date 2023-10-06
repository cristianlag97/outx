import 'package:formz/formz.dart';

enum BusinessNameError { empty, less, more }

class BusinessName extends FormzInput<String, BusinessNameError> {
  const BusinessName.pure() : super.pure('');
  const BusinessName.dirty(String value) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == BusinessNameError.empty) {
      return 'El campo es requerido';
    }
    if (displayError == BusinessNameError.less) {
      return 'No tiene mas de dos caracter';
    }
    if (displayError == BusinessNameError.more) {
      return 'Pasaste el límite de carácteres';
    }

    return null;
  }

  @override
  BusinessNameError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) {
      return BusinessNameError.empty;
    }
    if (value.length <= 1) return BusinessNameError.less;
    if (value.length >= 230) return BusinessNameError.more;
    return null;
  }
}
