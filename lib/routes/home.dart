import 'package:credit_card/widgets/containers/common/app_bar.dart';
import 'package:flutter/material.dart';

class HomeRoute extends StatelessWidget {
  const HomeRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double appBarHeightRatio = 0.065;
    double horizontalPaddingRatio = 0.075;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * horizontalPaddingRatio),
        child: Column(
          children: [
            CustomAppBar(
              height: appBarHeightRatio * size.height,
              title: "Home",
              width: size.width * (1 - 2 * horizontalPaddingRatio),
            )
          ],
        ),
      )),
    );
  }
}
