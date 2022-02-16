import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector_math;

import '../../../painters/common/master_card.dart';

class MasterCardContainer extends StatelessWidget {
  final double height;
  final vector_math.Vector3 objectDepthAxis;
  const MasterCardContainer(
      {Key? key, required this.height, required this.objectDepthAxis})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double aspectRatio = 2;
    double width = height * aspectRatio;
    return CustomPaint(
      painter: MasterCardPainter(objectDepthAxis),
      size: Size(width, height),
    );
  }
}
