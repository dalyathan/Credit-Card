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
    double radius = size.height * 0.5;
    double padding = (size.width - 4 * radius) * 0.5;
    Offset center1 = Offset(padding + radius, radius);
    Offset center2 = Offset(center1.dx + 2 * radius - overlapp, center1.dy);
    Path leftCirclePath = Path()
      ..addOval(Rect.fromCircle(center: center1, radius: radius));
    Path rightCirclePath = Path()
      ..addOval(Rect.fromCircle(center: center2, radius: radius));
    Path combinedPath =
        Path.combine(PathOperation.union, leftCirclePath, rightCirclePath);
    CanvasHelper.makeAppear3D(
        [combinedPath],
        canvas,
        size,
        Paint()
          ..color = MyTheme.lightBlue
          ..style = PaintingStyle.fill,
        objectDepthAxis);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
