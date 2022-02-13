import 'package:flutter/material.dart';

import '../widgets/containers/common/card.dart';
import 'dart:math';

class LoginRoute extends StatelessWidget {
  const LoginRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double cardWidthRatio = 0.7;
    Matrix4 transformer = Matrix4.rotationX(-pi * 0.1);
    transformer.rotateZ(pi * 0.1);
    // print(transformer.);
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Center(
            child: Container(
              color: Colors.amber,
              child: Transform(
                transform: transformer,
                alignment: FractionalOffset.center,
                child: CardContainer(
                  width: size.width * cardWidthRatio,
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
