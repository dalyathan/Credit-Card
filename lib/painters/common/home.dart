import 'package:flutter/material.dart';

class HomeIconPainter extends CustomPainter {
  final Color foregroundColor;

  HomeIconPainter(this.foregroundColor);
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    double roofheightRatio = 0.375;
    double doorHeightRatio = 0.3;
    double doorWidthRatio = 0.2;

    Offset A = Offset(0, size.height * roofheightRatio);
    Offset B = Offset(size.width * 0.5, 0);
    Offset C = Offset(size.width, A.dy);
    Offset D = Offset(size.width, size.height);
    Offset E = Offset(size.width * (0.5 + doorWidthRatio * 0.5), D.dy);
    Offset F = Offset(E.dx, size.height * (1 - doorHeightRatio));
    Offset G = Offset(F.dx - size.width * doorWidthRatio, F.dy);
    Offset H = Offset(G.dx, E.dy);
    Offset I = Offset(A.dx, H.dy);

    canvas.drawPath(
        Path()..addPolygon([A, B, C, D, E, F, G, H, I], true),
        Paint()
          ..strokeJoin = StrokeJoin.bevel
          ..color = foregroundColor);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
