import 'package:credit_card/theme.dart';
import 'package:credit_card/util/canvas_helper.dart';
import 'package:flutter/material.dart';

class DarkBlueSquaresPainter extends CustomPainter {
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
    CanvasHelper.drawObjectWithShadow(paths, canvas, size, brush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
