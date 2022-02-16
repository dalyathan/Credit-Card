import 'package:credit_card/util/canvas_helper.dart';
import 'package:vector_math/vector_math_64.dart';

import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import '../../theme.dart';

class CardBackgroundPainter extends CustomPainter {
  final Vector3 objectDepthAxis;

  CardBackgroundPainter(this.objectDepthAxis);

  @override
  void paint(Canvas canvas, Size size) {
    double borderRadiusRatio = 0.075;
    final brush = Paint()
      ..shader = ui.Gradient.linear(
        Offset(size.width, 0),
        Offset(0, size.height),
        [const Color.fromRGBO(79, 112, 141, 1), MyTheme.darkBlue],
      );
    Path rrectPath = Path()
      ..addRRect(RRect.fromRectAndRadius(
          Rect.fromCenter(
              center: Offset(size.width * 0.5, size.height * 0.5),
              width: size.width,
              height: size.height),
          Radius.circular(size.height * borderRadiusRatio)));
    CanvasHelper.draw3DWithoutShadow(
      [rrectPath],
      canvas,
      size,
      brush,
      objectDepthAxis,
      isShader: true,
    );
    //canvas.drawPath(rrectPath, brush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
