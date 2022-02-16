import 'package:credit_card/theme.dart';
import 'package:credit_card/util/canvas_helper.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector_math;

class MasterCardPainter extends CustomPainter {
  final vector_math.Vector3 objectDepthAxis;

  MasterCardPainter(this.objectDepthAxis);
  @override
  void paint(Canvas canvas, Size size) {
    double overlapp = size.width * 0.1;
    double gap = size.width * 0.035;
    double radius = size.height * 0.5;
    double padding = (size.width - 4 * radius + overlapp) * 0.5;
    Offset leftOverlappingOvalCenter = Offset(padding + radius, radius);
    Offset rightOverlappingOvalCenter = Offset(
        leftOverlappingOvalCenter.dx + 2 * radius - overlapp,
        leftOverlappingOvalCenter.dy);
    Paint brush = Paint()
      ..color = MyTheme.darkBlue
      ..style = PaintingStyle.fill;
    Path leftOverlappingOval = Path()
      ..addOval(
          Rect.fromCircle(center: leftOverlappingOvalCenter, radius: radius));
    Path rightOverlappingOval = Path()
      ..addOval(
          Rect.fromCircle(center: rightOverlappingOvalCenter, radius: radius));
    Path rightOval = Path.combine(PathOperation.reverseDifference,
        leftOverlappingOval, rightOverlappingOval);
    CanvasHelper.draw3dWithShadow([rightOval], canvas, size,
        brush..color = MyTheme.lightBlue, objectDepthAxis);
    Path leftOval = Path()
      ..addOval(Rect.fromCircle(
          center: leftOverlappingOvalCenter.translate(-gap, 0),
          radius: radius));
    CanvasHelper.draw3dWithShadow([leftOval], canvas, size,
        brush..color = MyTheme.darkBlue, objectDepthAxis);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
