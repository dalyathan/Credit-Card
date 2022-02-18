import 'package:credit_card/painters/common/overview.dart';
import 'package:flutter/material.dart';

class OverviewIcon extends StatelessWidget {
  final double width;
  const OverviewIcon({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double aspectRatio = 1.33;
    double height = width / aspectRatio;
    return CustomPaint(
      painter: OverviewIconPainter(IconTheme.of(context).color!),
      size: Size(width, height),
    );
  }
}
