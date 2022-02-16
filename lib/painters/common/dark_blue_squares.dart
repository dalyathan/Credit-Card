import 'package:credit_card/util/canvas_helper.dart';
import 'package:flutter/material.dart';

import '../../util/canvas_helper.dart';
import 'package:vector_math/vector_math_64.dart';

class DarkBlueSquaresPainter extends CustomPainter {
  final Vector3 objectDepthAxis;

  DarkBlueSquaresPainter(this.objectDepthAxis);

  @override
  void paint(Canvas canvas, Size size) {
    Paint brush = Paint()
      ..color = const Color.fromRGBO(74, 137, 186, 1)
      ..strokeWidth = 2
      ..style = PaintingStyle.fill;
    double squareWidth = size.height;
    double gap = (size.width - 4 * squareWidth) / 3;
    Offset center = Offset(squareWidth * 0.5, size.height * 0.5);
    List<Path> paths = [];
    while (center.dx <= size.width - squareWidth * 0.5) {
      paths.add(Path()
        ..addRRect(RRect.fromRectAndRadius(
            Rect.fromCenter(
                center: center, width: squareWidth, height: size.height),
            Radius.circular(size.height * 0.15))));
      center = center.translate(squareWidth + gap, 0);
    }
    CanvasHelper.draw3dWithShadow(paths, canvas, size, brush, objectDepthAxis);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
