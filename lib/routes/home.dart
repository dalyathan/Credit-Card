import 'package:credit_card/widgets/containers/common/app_bar.dart';
import 'package:flutter/material.dart';

import '../widgets/containers/home/my_card.dart';

class HomeRoute extends StatelessWidget {
  const HomeRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double appBarHeightRatio = 0.065;
    double horizontalPaddingRatio = 0.075;
    Size size = MediaQuery.of(context).size;
    double largeSpacerRatio = 0.05;
    double myCardHeightRatio = 0.25;
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
            ),
            SizedBox(
              height: size.height * largeSpacerRatio,
            ),
            MyCardContainer(
              height: size.height * myCardHeightRatio,
            )
          ],
        ),
      )),
    );
  }
}
