import 'package:flutter/material.dart';

import '../widgets/containers/common/card.dart';
import 'dart:math';

class LoginRoute extends StatelessWidget {
  const LoginRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double cardWidthRatio = 0.7;
    Matrix4 transformer = Matrix4.rotationX(-pi * 0.25);
    transformer.rotateY(-pi * 0.05);
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Center(
            child: Transform(
              transform: transformer,
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
