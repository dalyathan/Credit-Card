import 'package:flutter/material.dart';

import '../../painters/common/home.dart';

class HomeIcon extends StatelessWidget {
  final double width;
  const HomeIcon({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double aspectRatio = 0.95;
    double height = width / aspectRatio;
    return CustomPaint(
      painter: HomeIconPainter(IconTheme.of(context).color!),
      size: Size(width, height),
    );
  }
}
