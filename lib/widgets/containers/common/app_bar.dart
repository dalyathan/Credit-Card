import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'blue_gradient_background.dart';
import 'custom_icon.dart';

class CustomAppBar extends StatelessWidget {
  final double height;
  final double width;
  final String title;
  const CustomAppBar(
      {Key? key,
      required this.height,
      required this.title,
      required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: height,
          width: height,
          child: Image.asset("assets/images/me.jpg"),
        ),
        SizedBox(
          width: width * 0.2,
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              title,
              style: GoogleFonts.sora(
                  color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        CustomIcon(
          iconData: FontAwesomeIcons.solidCommentDots,
          size: height,
        )
      ],
    );
  }
}
