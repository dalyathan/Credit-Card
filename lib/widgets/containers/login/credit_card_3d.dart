import 'dart:math';

import 'package:flutter/material.dart';

import '../common/blue_gradient_background.dart';
import '../common/card.dart';

class CreditCard3DContainer extends StatelessWidget {
  final double height;
  const CreditCard3DContainer({Key? key, required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double cardWidthRatio = 0.7;
    Matrix4 transformer = Matrix4.translationValues(0, 0, 100)
      ..rotateY(pi * 0.05)
      ..rotateZ(pi * 0.02);
    transformer.rotateX(pi * 0.2);
    double creditCardIconTopOffset = 0.3;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        BlueGradientContainer(
          height: height,
          width: size.width,
        ),
        Positioned(
          top: creditCardIconTopOffset * height,
          left: size.width * 0.15,
          child: Transform(
            transform: transformer,
            alignment: FractionalOffset.center,
            child: CardContainer(
              width: size.width * cardWidthRatio,
            ),
          ),
        ),
      ],
    );
  }
}
