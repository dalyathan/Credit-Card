import 'package:credit_card/painters/common/light_blue_bar.dart';
import 'package:flutter/material.dart';

class LightBlueBarContainer extends StatelessWidget {
  final double width;
  final double height;
  const LightBlueBarContainer(
      {Key? key, required this.width, required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: LightBlueBarPainter(),
      child: SizedBox(
        height: height,
        width: width,
      ),
    );
  }
}
