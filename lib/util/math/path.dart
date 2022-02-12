import 'package:flutter/material.dart';
import 'dart:math';

class PathVectorUtil {
  final Size frame;

  PathVectorUtil(this.frame);

  Path rotateZ(Path oldPath, double counterClockwiseInRadians) {
    Path cartesianPath = toCartesian(oldPath);
    Path rotatedCartesianPath = cartesianPath
        .transform(Matrix4.rotationZ(counterClockwiseInRadians).storage);
    Path rotatedDartianPath = toDartian(rotatedCartesianPath);
    return rotatedDartianPath;
  }

  Path toCartesian(Path dartianPath) =>
      dartianPath.shift(Offset(-frame.width * 0.5, -frame.height * 0.5));

  Path toDartian(Path cartesianPath) =>
      cartesianPath.shift(Offset(frame.width * 0.5, frame.height * 0.5));

  Path rotateX(Path oldPath, double counterClockwiseInRadians) {
    Path cartesianPath = toCartesian(oldPath);
    Path rotatedCartesianPath = cartesianPath
        .transform(Matrix4.rotationY(counterClockwiseInRadians).storage);
    Path rotatedDartianPath = toDartian(rotatedCartesianPath);
    return rotatedDartianPath;
  }
}
