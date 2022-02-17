import 'package:flutter/material.dart';

import 'blue_gradient_background.dart';

class CustomIcon extends StatelessWidget {
  final double size;
  final Widget icon;
  const CustomIcon({Key? key, required this.size, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double iconWidthRatio = 0.8;
    double iconBorderRadiusRatio = 0.5;
    return Stack(
      alignment: Alignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(size * iconBorderRadiusRatio),
          child: BlueGradientContainer(
            height: size,
            width: size,
          ),
        ),
        IconTheme(
          data: const IconThemeData(color: Colors.white),
          child: SizedBox(
              height: size * iconWidthRatio,
              width: size * iconWidthRatio,
              child: icon),
        ),
      ],
    );
  }
}
