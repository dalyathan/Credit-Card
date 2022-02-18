import 'package:flutter/material.dart';

class OverviewIconPainter extends CustomPainter {
  final Color foregroundColor;

  OverviewIconPainter(this.foregroundColor);
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    double topRectangleheight = 0.2;
    double gapRatio = 0.125;
    double bottomRectangleHeightRatio = 1 - (topRectangleheight + gapRatio);
    double whiteSpaceHeightRatio = 0.1;
    double whiteSpaceWidthRatio = 0.2;

    Offset A = Offset(0, size.width * topRectangleheight * 0.5);
    Offset B = Offset(size.width, A.dy);
    canvas.drawLine(
        A,
        B,
        Paint()
          ..strokeWidth = size.height * topRectangleheight
          ..color = foregroundColor);
    Offset C = Offset(0, size.height * (1 - bottomRectangleHeightRatio * 0.5));
    Offset D = Offset(size.width, C.dy);
    canvas.drawLine(
        C,
        D,
        Paint()
          ..strokeWidth = size.height * bottomRectangleHeightRatio
          ..color = foregroundColor);
    Offset E = Offset(
        size.width * 0.65, size.height * (0.7 + whiteSpaceHeightRatio * 0.5));
    Offset F = Offset(E.dx + size.width * whiteSpaceWidthRatio, E.dy);
    canvas.drawLine(
        E,
        F,
        Paint()
          ..strokeWidth = size.height * whiteSpaceHeightRatio
          ..color = Colors.white);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
