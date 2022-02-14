import 'package:flutter/material.dart';

import '../../../theme.dart';

class BlueGradientContainer extends StatelessWidget {
  final double width;
  final double height;
  const BlueGradientContainer(
      {Key? key, required this.width, required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double borderRadiusRatio = 0.1;
    return Container(
      width: width,
      height: height,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: <Color>[Color.fromRGBO(79, 112, 141, 1), MyTheme.darkBlue],
        ),
      ),
    );
  }
}
