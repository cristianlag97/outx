import 'package:flutter/material.dart' hide Colors;
import 'package:outmap/config/config.dart';

class CustomDropDownButton extends StatelessWidget {
  const CustomDropDownButton({
    required this.dropdownItems,
    required this.onChanged,
    this.dropdownValue,
    this.label,
    this.hint,
    this.errorMessage,
    super.key,
  });

  final String? dropdownValue;
  final List<String> dropdownItems;
  final String? label;
  final String? hint;
  final String? errorMessage;
  final Function(String?) onChanged;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final border = OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(40));

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE4DFDF)),
      ),
      child: DropdownButtonFormField<String>(
        value: dropdownValue, // Valor seleccionado
        onChanged: onChanged,
        items: dropdownItems.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        style: const TextStyle(fontSize: 16, color: Color(0xFF747688)),
        decoration: InputDecoration(
          floatingLabelStyle: const TextStyle(
            color: Color(0xFF747688),
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          enabledBorder: border,
          focusedBorder: border,
          isDense: true,
          label: label != null ? Text(label!) : null,
          hintText: hint,
          errorText: errorMessage,
          focusColor: colors.primary,
        ),
      ),
    );
  }
}
