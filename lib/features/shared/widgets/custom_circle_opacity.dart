import 'package:flutter/material.dart' hide Colors;

import '../../../config/config.dart';

class CustomCircileOpacity extends StatelessWidget {
  const CustomCircileOpacity({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.3,
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.colorSeed.withOpacity(0.01),
          boxShadow: [
            BoxShadow(
              color: Colors.colorSeed.withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 20,
              offset: const Offset(0, 3),
            ),
          ],
        ),
      ),
    );
  }
}
