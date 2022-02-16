import 'package:credit_card/widgets/containers/common/custom_icon.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitledIconContainer extends StatelessWidget {
  final double height;
  final IconData iconData;
  final String title;
  const TitledIconContainer(
      {Key? key,
      required this.height,
      required this.iconData,
      required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomIcon(size: height * 0.6, iconData: iconData),
        Text(title, style: GoogleFonts.sora())
      ],
    );
  }
}
