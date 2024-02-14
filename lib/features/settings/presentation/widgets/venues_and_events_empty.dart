import 'package:flutter/material.dart' hide Colors;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:outmap/config/constans/constans.dart';

class VenueAndEventsEmpty extends StatelessWidget {
  const VenueAndEventsEmpty(
      {super.key, required this.title, required this.message});
  final String title;
  final String message;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return SizedBox(
      child: Column(
        children: <Widget>[
          SvgPicture.asset('assets/images/new.svg'),
          gapy16,
          Text(
            title,
            style: textStyle.bodyLarge!.copyWith(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          gapy16,
          Text(
            message,
            style: textStyle.bodyLarge!.copyWith(
              color: const Color(0xFF747688),
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}
