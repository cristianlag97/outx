import 'package:flutter/material.dart';

SnackBar customSnackbar({
  required String message,
  String btnLabel = 'Ok',
  Duration duration = const Duration(seconds: 2),
  VoidCallback? onOk,
}) =>
    SnackBar(
      content: Text(message),
      duration: duration,
      action: SnackBarAction(
        label: btnLabel,
        onPressed: () {
          if (onOk != null) {
            onOk();
          }
        },
      ),
    );
