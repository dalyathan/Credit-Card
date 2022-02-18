import 'package:credit_card/painters/common/stats.dart';
import 'package:flutter/material.dart';

class StatsIcon extends StatelessWidget {
  final double width;
  const StatsIcon({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double aspectRatio = 0.9;
    return CustomPaint(
      painter: StatsIconPainter(IconTheme.of(context).color!),
      size: Size(width, width / aspectRatio),
    );
  }
}
