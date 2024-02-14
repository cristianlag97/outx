import 'package:flutter/material.dart' hide Colors;
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../config/config.dart';

class CustomButtomFilter extends StatelessWidget {
  const CustomButtomFilter({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final textStyle = Theme.of(context).textTheme;
    return Container(
      padding: px8,
      decoration: BoxDecoration(
        color: Colors.colorSeed,
        borderRadius: BorderRadius.circular(20),
      ),
      width: size.width * 0.25,
      height: size.height * 0.05,
      child: Row(
        children: <Widget>[
          SvgPicture.asset('assets/images/filter.svg'),
          const SizedBox(width: 8),
          Text(
            'Filters',
            style: textStyle.bodyMedium!.copyWith(color: Colors.white),
          )
        ],
      ),
    );
  }
}
