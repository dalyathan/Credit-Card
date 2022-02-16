import 'package:flutter/material.dart';

import 'blue_gradient_background.dart';

class CustomIcon extends StatelessWidget {
  final double size;
  final IconData iconData;
  const CustomIcon({Key? key, required this.size, required this.iconData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double iconWidthRatio = 0.6;
    double iconBorderRadiusRatio = 0.2;
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(size * iconBorderRadiusRatio),
          child: BlueGradientContainer(
            height: size,
            width: size,
          ),
        ),
        Positioned(
          left: size * (1 - iconWidthRatio) * 0.5,
          top: size * (1 - iconWidthRatio) * 0.45,
          child: Icon(
            iconData,
            color: Colors.white,
            size: size * iconWidthRatio,
          ),
        )
      ],
    );
  }
}
