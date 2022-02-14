import '/theme.dart';
import '../../util/canvas_helper.dart';
import 'package:flutter/material.dart';

class LightBlueBarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint brush = Paint()
      ..color = MyTheme.lightBlue
      ..style = PaintingStyle.fill;
    Path barPath = Path()
      ..addRRect(RRect.fromRectAndRadius(
          Rect.fromCenter(
              center: Offset(size.width * 0.5, size.height * 0.5),
              width: size.width,
              height: size.height),
          Radius.circular(size.height * 0.15)));
    CanvasHelper.drawObjectWithShadow([barPath], canvas, size, brush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
