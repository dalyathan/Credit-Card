import 'package:flutter/material.dart';

import '../widgets/containers/common/card.dart';

class LoginRoute extends StatelessWidget {
  const LoginRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double cardWidthRatio = 0.7;
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Center(
            child: CardContainer(
              width: size.width * cardWidthRatio,
            ),
          )
        ],
      )),
    );
  }
}
