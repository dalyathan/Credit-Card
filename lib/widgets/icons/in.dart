import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InIcon extends StatelessWidget {
  final double height;
  const InIcon({Key? key, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: height,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color.fromRGBO(50, 209, 185, 1),
      ),
      child: Align(
        alignment: Alignment(0, -0.75),
        child: Icon(FontAwesomeIcons.caretUp,
            size: height * 0.75, color: Colors.white),
      ),
    );
  }
}
