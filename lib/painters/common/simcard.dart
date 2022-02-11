import 'package:credit_card/theme.dart';
import 'package:flutter/material.dart';

class SimcardPainter extends CustomPainter {
  late Canvas canvas;
  late Paint brush;
  late Size size;
  late double cornerCutRatio;
  late double gapRatio;
  late double KJLengthRatio;
  late double JIheightRatio;
  late double LALengthRatio;
  late double IHLengthRatio;
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    KJLengthRatio = 0.225;
    JIheightRatio = 0.1;
    gapRatio = 0.05;
    cornerCutRatio = 0.05;
    LALengthRatio = 0.15;
    IHLengthRatio = 1 - (2 * cornerCutRatio + 2 * KJLengthRatio + 2 * gapRatio);
    this.canvas = canvas;
    this.size = size;
    brush = Paint()
      ..color = MyTheme.lightBlue
      ..strokeWidth = 2
      ..style = PaintingStyle.fill;

    paintUpperAndBottomPart();
  }

  paintUpperAndBottomPart({bool isUpper = true}) {
    Offset A = Offset(0, size.height * cornerCutRatio);
    Offset B = Offset(size.width * cornerCutRatio, 0);
    Offset C = Offset(size.width * (1 - cornerCutRatio), B.dy);
    Offset D = Offset(size.width, A.dy);
    Offset E = Offset(D.dx, D.dy + size.height * LALengthRatio);
    Offset F = Offset(
        size.width * (1 - cornerCutRatio), E.dy + size.height * cornerCutRatio);
    Offset G = Offset(F.dx - size.width * KJLengthRatio, F.dy);
    Offset H = Offset(
        G.dx - size.width * gapRatio, G.dy - size.height * JIheightRatio);
    Offset I = Offset(H.dx - size.width * IHLengthRatio, H.dy);
    Offset J = Offset(I.dx - size.width * gapRatio, G.dy);
    Offset K = Offset(J.dx - size.width * KJLengthRatio, J.dy);
    Offset L = Offset(
        K.dx - size.width * cornerCutRatio, A.dy + size.height * LALengthRatio);

    Path path = Path()..addPolygon([A, B, C, D, E, F, G, H, I, J, K, L], true);
    canvas.drawPath(path, brush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
