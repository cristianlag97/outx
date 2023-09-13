import 'package:formz/formz.dart';

enum GenderError { empty }

class Gender extends FormzInput<String, GenderError> {
  const Gender.pure() : super.pure('');
  const Gender.dirty(String value) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == GenderError.empty) {
      return 'Debes seleccionar una opción';
    }
    return null;
  }

  @override
  GenderError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return GenderError.empty;
    return null;
  }
}
