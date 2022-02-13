import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart';
import '../../../painters/common/dark_blue_squares.dart';

class DarkBlueSquaresContainer extends StatelessWidget {
  final double height;
  final double width;
  final Vector3 objectDepthAxis;

  const DarkBlueSquaresContainer(
      {Key? key,
      required this.height,
      required this.width,
      required this.objectDepthAxis})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DarkBlueSquaresPainter(objectDepthAxis),
      size: Size(width, height),
    );
  }
}
