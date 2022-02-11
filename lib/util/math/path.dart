import 'package:flutter/material.dart';

class PathVectorUtil {
  final Size frame;

  PathVectorUtil(this.frame);

  Path rotatePath(Path oldPath, double counterClockwiseInRadians) {
    Path cartesianPath = toCartesianPath(oldPath);
    Path rotatedCartesianPath = cartesianPath
        .transform(Matrix4.rotationZ(counterClockwiseInRadians).storage);
    Path rotatedDartianPath = toDartianPath(rotatedCartesianPath);
    return rotatedDartianPath;
  }

  Path toCartesianPath(Path dartianPath) =>
      dartianPath.shift(Offset(-frame.width * 0.5, -frame.height * 0.5));

  Path toDartianPath(Path cartesianPath) =>
      cartesianPath.shift(Offset(frame.width * 0.5, frame.height * 0.5));
}
