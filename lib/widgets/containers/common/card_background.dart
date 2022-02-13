import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart';

import '../../../painters/common/card_background.dart';

class CardBackground extends StatelessWidget {
  final Vector3 objectDepthAxis;
  final double width;
  final double height;
  const CardBackground(
      {Key? key,
      required this.width,
      required this.height,
      required this.objectDepthAxis})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(width, height),
      painter: CardBackgroundPainter(objectDepthAxis),
    );
  }
}
