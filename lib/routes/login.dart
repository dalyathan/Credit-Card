import 'package:flutter/material.dart';

import '../widgets/containers/common/card.dart';
import 'dart:math';

class LoginRoute extends StatelessWidget {
  const LoginRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double cardWidthRatio = 0.7;
    Matrix4 transformer = Matrix4.translationValues(0, 0, 100)
      ..rotateY(pi * 0.05)
      ..rotateZ(pi * 0.02);
    transformer.rotateX(pi * 0.2);
    // rotationX(pi * 0.1);
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Center(
            child: Transform(
              transform: transformer,
              alignment: FractionalOffset.center,
              child: CardContainer(
                width: size.width * cardWidthRatio,
              ),
            ),
          )
        ],
      )),
    );
  }
}
