import 'package:flutter/material.dart' hide Colors;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:outmap/config/config.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    this.onFieldSubmitted,
    this.focusNode,
    this.label,
    this.hint,
    this.errorMessage,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.validator,
    this.prefixIcon,
    this.isPassword = false,
    this.onActivateObscureText,
    this.initialValue,
    this.isBorderRadius = true,
    this.fontSize = 16,
    super.key,
  });

  final String? label;
  final String? hint;
  final String? errorMessage;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final Function(String)? onFieldSubmitted;
  final Widget? prefixIcon;
  final bool isPassword;
  final Function()? onActivateObscureText;
  final String? initialValue;
  final bool isBorderRadius;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final border = OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(40));

    return Container(
      decoration: BoxDecoration(
        borderRadius: isBorderRadius ? BorderRadius.circular(12) : null,
        border:
            isBorderRadius ? Border.all(color: const Color(0xFFE4DFDF)) : null,
      ),
      child: TextFormField(
        initialValue: initialValue,
        onTapOutside: (PointerDownEvent event) =>
            FocusScope.of(context).unfocus(),
        onChanged: onChanged,
        focusNode: focusNode,
        onFieldSubmitted: onFieldSubmitted,
        validator: validator,
        obscureText: obscureText,
        keyboardType: keyboardType,
        style: TextStyle(fontSize: fontSize, color: const Color(0xFF747688)),
        decoration: InputDecoration(
          floatingLabelStyle: TextStyle(
            color: const Color(0xFF747688),
            fontWeight: FontWeight.bold,
            fontSize: fontSize,
          ),
          enabledBorder: border,
          focusedBorder: border,
          errorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
            color: Colors.redshade,
          )),
          focusedErrorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
            color: Colors.redshade,
          )),
          isDense: true,
          label: label != null ? Text(label!) : null,
          labelStyle:
              TextStyle(fontSize: fontSize, color: const Color(0xFF747688)),
          hintText: hint,
          errorText: errorMessage,
          focusColor: colors.primary,
          prefixIcon: prefixIcon,
          suffixIcon: isPassword
              ? IconButton(
                  icon: Icon(
                    obscureText
                        ? FontAwesomeIcons.eyeSlash
                        : FontAwesomeIcons.eye,
                    color: const Color(0xFF747688),
                  ),
                  onPressed: onActivateObscureText,
                )
              : null,
        ),
      ),
    );
  }
}
