import 'package:flutter/material.dart';

import '../../../painters/common/dark_blue_squares.dart';

class DarkBlueSquaresContainer extends StatelessWidget {
  final double height;
  final double width;
  const DarkBlueSquaresContainer(
      {Key? key, required this.height, required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DarkBlueSquaresPainter(),
      size: Size(width, height),
    );
  }
}
