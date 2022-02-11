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
    gapRatio = 0.05;
    cornerCutRatio = 0.025;
    LALengthRatio = 0.215;
    IHLengthRatio = 1 - 2 * (cornerCutRatio + KJLengthRatio + gapRatio);
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
    paintMiddlePiece();
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
    canvas.drawShadow(path.shift(Offset(-size.width * 0.125, 0)),
        const Color.fromRGBO(37, 45, 75, 1), size.width * 0.05, true);
    Path lowerPart = pathVectorUtil.reflectXAxis(path);
    canvas.drawPath(lowerPart, brush);
    canvas.drawShadow(lowerPart.shift(Offset(-size.width * 0.125, 0)),
        const Color.fromRGBO(37, 45, 75, 1), size.width * 0.05, true);
  }

  paintLeftAndRightPart() {
    Offset M = Offset(
        0, size.height * (3 * cornerCutRatio + gapRatio + LALengthRatio));
    Offset N = Offset(
        size.width * cornerCutRatio, M.dy - size.height * cornerCutRatio);
    Offset O = Offset(N.dx + size.width * KJLengthRatio, N.dy);
    Offset P = Offset(O.dx + size.width * cornerCutRatio,
        O.dy + size.height * cornerCutRatio);
    Offset Q = Offset(P.dx, P.dy + size.height * PQLengthRatio);
    Offset R = Offset(Q.dx - size.width * cornerCutRatio,
        Q.dy + size.height * cornerCutRatio);
    Offset S = Offset(R.dx - size.width * KJLengthRatio, R.dy);
    Offset T = Offset(M.dx, S.dy - size.height * cornerCutRatio);
    Path path = Path()..addPolygon([M, N, O, P, Q, R, S, T], true);
    canvas.drawPath(path, brush);
    canvas.drawShadow(path.shift(Offset(-size.width * 0.125, 0)),
        const Color.fromRGBO(37, 45, 75, 1), size.width * 0.05, true);
    canvas.drawPath(pathVectorUtil.reflectYAxis(path), brush);
  }

  paintMiddlePiece() {
    Offset U = Offset(
        size.width * (2 * cornerCutRatio + KJLengthRatio + gapRatio),
        size.height * (cornerCutRatio + LALengthRatio));
    Offset V = Offset(
        size.width * (1 - (2 * cornerCutRatio + KJLengthRatio + gapRatio)),
        U.dy);
    Offset W =
        Offset(V.dx, size.height * (1 - (cornerCutRatio + LALengthRatio)));
    Offset X = Offset(U.dx, W.dy);
    canvas.drawPath(Path()..addPolygon([U, V, W, X], true), brush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
