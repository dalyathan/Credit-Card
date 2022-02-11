import 'package:credit_card/theme.dart';
import 'package:flutter/material.dart';

import '../../util/math/path.dart';

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
  late double PQLengthRatio;
  late PathVectorUtil pathVectorUtil;
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    KJLengthRatio = 0.225;
    JIheightRatio = 0.075;
    gapRatio = 0.1;
    cornerCutRatio = 0.05;
    LALengthRatio = 0.175;
    IHLengthRatio = 1 - (2 * cornerCutRatio + 2 * KJLengthRatio + 2 * gapRatio);
    PQLengthRatio = 1 - 2 * (LALengthRatio + gapRatio + 3 * cornerCutRatio);
    this.canvas = canvas;
    this.size = size;
    brush = Paint()
      ..color = MyTheme.lightBlue
      ..strokeWidth = 2
      ..style = PaintingStyle.fill;
    pathVectorUtil = PathVectorUtil(size);

    paintUpperAndBottomPart();
    paintLeftAndRightPart();
  }

  paintUpperAndBottomPart() {
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
    canvas.drawPath(pathVectorUtil.reflectXAxis(path), brush);
  }

  paintLeftAndRightPart() {
    Offset M = Offset(
        0, size.height * (3 * cornerCutRatio + gapRatio + LALengthRatio));
    Offset N = Offset(
        size.width * cornerCutRatio, M.dy + size.height * cornerCutRatio);
    Offset O = Offset(N.dx + size.width * KJLengthRatio, N.dy);
    Offset P = Offset(O.dx + size.width * cornerCutRatio,
        O.dy + size.height * cornerCutRatio);
    Offset Q = Offset(P.dx, P.dy + size.height * PQLengthRatio);
    Path path = Path()..addPolygon([M, N, O, P, Q], true);
    canvas.drawPath(path, brush);
    canvas.drawPath(pathVectorUtil.reflectYAxis(path), brush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
