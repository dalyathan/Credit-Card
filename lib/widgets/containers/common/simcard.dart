import 'package:flutter/material.dart';
import 'dart:ui';

import '../../../painters/common/simcard.dart';
import 'package:vector_math/vector_math_64.dart';

class SimcardContainer extends StatelessWidget {
  final double size;
  final Vector3 objectdepthAxis;
  const SimcardContainer(
      {Key? key, required this.size, required this.objectdepthAxis})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: SimcardPainter(objectdepthAxis),
      size: Size.square(size),
    );
  }
}
