import 'package:flutter/material.dart' hide Colors;
import 'package:outmap/config/config.dart';

class CustomDropDownButton extends StatefulWidget {
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
  State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  String hasValue = '';

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    const border = OutlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
    );

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE4DFDF)),
      ),
      child: DropdownButtonFormField<String>(
        onTap: () {
          print('Hola mundo');
        },
        value: widget.dropdownValue,
        onChanged: (String? value) {
          widget.onChanged(value);
          hasValue = value ?? '';
          setState(() {});
        },
        items:
            widget.dropdownItems.map<DropdownMenuItem<String>>((String value) {
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
          label: hasValue.isNotEmpty
              ? null
              : widget.label != null
                  ? Text(widget.label!)
                  : null,
          hintText: widget.hint,
          errorText: widget.errorMessage,
          focusColor: colors.primary,
        ),
      ),
    );
  }
}
