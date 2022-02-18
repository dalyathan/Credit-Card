import 'package:flutter/material.dart';

class StatsIconPainter extends CustomPainter {
  final Color foregroundColor;

  StatsIconPainter(this.foregroundColor);
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint

    double leftBarHeightRatio = 0.3;
    double middleBarHeightRatio = 0.65;
    double barWidthRatio = 0.3;
    double barGapRatio = (1 - 3 * barWidthRatio) * 0.5;
    Paint brush = Paint()
      ..strokeWidth = size.width * barWidthRatio
      ..color = foregroundColor;
    Offset A = Offset(size.width * barWidthRatio * 0.5, size.height);
    Offset B = Offset(A.dx, A.dy - size.height * leftBarHeightRatio);
    canvas.drawLine(A, B, brush);
    Offset C = Offset(A.dx + size.width * (barWidthRatio + barGapRatio), A.dy);
    Offset D = Offset(C.dx, C.dy - size.height * middleBarHeightRatio);
    canvas.drawLine(C, D, brush);
    Offset E = Offset(C.dx + size.width * (barWidthRatio + barGapRatio), C.dy);
    Offset F = Offset(E.dx, 0);
    canvas.drawLine(E, F, brush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
