import 'dart:math';

import 'package:credit_card/theme.dart';
import 'package:flutter/material.dart';

import '../../util/canvas_helper.dart';
import '../../util/math/path.dart';
import 'package:vector_math/vector_math_64.dart';

class SimcardPainter extends CustomPainter {
  final Vector3 objectDepthAxis;
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

  SimcardPainter(this.objectDepthAxis);
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    KJLengthRatio = 0.235;
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

    List<Path> upperAndBottomPaths = getUpperAndBottomPath();
    List<Path> leftAndRightPaths = getLeftAndRightPath();
    Path middlePath = getMiddlePath();
    CanvasHelper.draw3dWithShadow(
        [...upperAndBottomPaths, ...leftAndRightPaths, middlePath],
        canvas,
        size,
        brush,
        objectDepthAxis);
// drawActual([...upperAndBottomPaths, ...leftAndRightPaths, middlePath]);
  }

  List<Path> getUpperAndBottomPath() {
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

    Path upperPart = Path()
      ..addPolygon([A, B, C, D, E, F, G, H, I, J, K, L], true);
    Path lowerPart = pathVectorUtil.rotateZ(upperPart, -pi);
    return [lowerPart, upperPart];
  }

  List<Path> getLeftAndRightPath() {
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
    Path leftPart = Path()..addPolygon([M, N, O, P, Q, R, S, T], true);
    Path rightPart = pathVectorUtil.rotateX(leftPart, -pi);
    return [leftPart, rightPart];
  }

  Path getMiddlePath() {
    Offset U = Offset(
        size.width * (2 * cornerCutRatio + KJLengthRatio + gapRatio),
        size.height * (cornerCutRatio + LALengthRatio));
    Offset V = Offset(
        size.width * (1 - (2 * cornerCutRatio + KJLengthRatio + gapRatio)),
        U.dy);
    Offset W =
        Offset(V.dx, size.height * (1 - (cornerCutRatio + LALengthRatio)));
    Offset X = Offset(U.dx, W.dy);
    return Path()..addPolygon([U, V, W, X], true);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
