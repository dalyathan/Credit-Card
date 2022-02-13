import 'package:credit_card/painters/common/light_blue_bar.dart';
import 'package:vector_math/vector_math_64.dart';
import 'package:flutter/material.dart';

class LightBlueBarContainer extends StatelessWidget {
  final double width;
  final double height;
  final Vector3 objectDepthAxis;

  const LightBlueBarContainer(
      {Key? key,
      required this.width,
      required this.height,
      required this.objectDepthAxis})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: LightBlueBarPainter(objectDepthAxis),
      child: SizedBox(
        height: height,
        width: width,
      ),
    );
  }
}
