import 'package:formz/formz.dart';

enum FullNameCompanyError { empty, less, more }

class FullNameCompany extends FormzInput<String, FullNameCompanyError> {
  const FullNameCompany.pure() : super.pure('');
  const FullNameCompany.dirty(String value) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == FullNameCompanyError.empty) {
      return 'El campo es requerido';
    }
    if (displayError == FullNameCompanyError.less) {
      return 'No tiene mas de dos caracter';
    }
    if (displayError == FullNameCompanyError.more) {
      return 'Pasaste el límite de carácteres';
    }

    return null;
  }

  @override
  FullNameCompanyError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) {
      return FullNameCompanyError.empty;
    }
    if (value.length <= 1) return FullNameCompanyError.less;
    if (value.length >= 230) return FullNameCompanyError.more;
    return null;
  }
}
