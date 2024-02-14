import 'package:flutter/material.dart' hide Colors;

import '../../../config/config.dart';

class CustomFilledButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final Color? buttonColor;
  final bool isPrimaryButton;
  final IconData? icon;
  final String? img;
  final double left;
  final Radius borderRadius;

  const CustomFilledButton({
    this.icon,
    required this.text,
    this.onPressed,
    this.buttonColor,
    this.isPrimaryButton = true,
    this.img,
    this.left = 85,
    this.borderRadius = const Radius.circular(10),
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 271,
      height: 58,
      child: FilledButton(
        style: FilledButton.styleFrom(
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(borderRadius),
          ),
        ),
        onPressed: onPressed,
        child: isPrimaryButton
            ? SizedBox(
                width: 271,
                height: 58,
                child: Stack(
                  children: [
                    Positioned(
                      top: 20,
                      left: left,
                      child: Text(
                        text,
                      ),
                    ),
                    Positioned(
                      top: 1,
                      bottom: 1,
                      right: 1,
                      child: CircleAvatar(
                        backgroundColor: const Color(0xFF495DED),
                        child: Icon(
                          icon,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              )
            : Row(
                children: <Widget>[
                  Image.asset(
                    img!,
                    width: 26,
                  ),
                  const SizedBox(width: 20),
                  Text(
                    text,
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
