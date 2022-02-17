import 'package:flutter/material.dart';
import 'dart:math';

class ExchangeIconPainter extends CustomPainter {
  late Canvas canvas;
  late Size size;
  late Paint brush;
  late double horizontalArrowPaddingRatio;
  late double verticalArrowPaddingRatio;
  late double arrowHeadLengthRatio;
  late double arrowHeadSlope;

  ExchangeIconPainter();
  @override
  void paint(Canvas canvas, Size size) {
    brush = Paint()
      ..color = Colors.white
      ..strokeWidth = 1.75
      ..strokeJoin = StrokeJoin.round
      ..style = PaintingStyle.fill;
    this.size = size;
    this.canvas = canvas;
    horizontalArrowPaddingRatio = 0.2;
    verticalArrowPaddingRatio = 0.4;
    arrowHeadLengthRatio = 0.25;
    arrowHeadSlope = 0.7;
    drawLeftArrow();
    drawRightArrow();
  }

  void drawLeftArrow() {
    Offset leftTip = Offset(size.width * horizontalArrowPaddingRatio,
        size.height * verticalArrowPaddingRatio);
    Offset rightTip =
        Offset(size.width * (1 - horizontalArrowPaddingRatio), leftTip.dy);
    Offset upperTip = Offset(
        leftTip.dx + acos(arrowHeadSlope) * size.width * arrowHeadLengthRatio,
        leftTip.dy - asin(arrowHeadSlope) * size.width * arrowHeadLengthRatio);
    canvas.drawLine(rightTip, leftTip, brush);
    canvas.drawLine(upperTip, leftTip, brush);
  }

  void drawRightArrow() {
    Offset leftTip = Offset(size.width * horizontalArrowPaddingRatio,
        size.height * (1 - verticalArrowPaddingRatio));
    Offset rightTip =
        Offset(size.width * (1 - horizontalArrowPaddingRatio), leftTip.dy);
    Offset lowerTip = Offset(
        rightTip.dx - acos(arrowHeadSlope) * size.width * arrowHeadLengthRatio,
        rightTip.dy + asin(arrowHeadSlope) * size.width * arrowHeadLengthRatio);
    canvas.drawLine(rightTip, leftTip, brush);
    canvas.drawLine(lowerTip, rightTip, brush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) =>
      this != oldDelegate;
}
