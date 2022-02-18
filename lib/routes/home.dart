import 'package:credit_card/widgets/containers/common/app_bar.dart';
import 'package:credit_card/widgets/containers/common/bottom_navbar.dart';
import 'package:flutter/material.dart';

import '../widgets/containers/home/actions.dart';
import '../widgets/containers/home/last_transactions_list.dart';
import '../widgets/containers/home/my_card.dart';

class HomeRoute extends StatelessWidget {
  const HomeRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double appBarHeightRatio = 0.065;
    double horizontalPaddingRatio = 0.075;
    Size size = MediaQuery.of(context).size;
    SizedBox largeSpacer = SizedBox(
      height: size.height * 0.05,
    );
    double myCardHeightRatio = 0.25;
    double actionsHeightRatio = 0.1;
    return Column(
      children: [
        Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * horizontalPaddingRatio),
            child: CustomAppBar(
              height: appBarHeightRatio * size.height,
              title: "Home",
              width: size.width * (1 - 2 * horizontalPaddingRatio),
            )),
        largeSpacer,
        Padding(
            padding: EdgeInsets.only(left: size.width * horizontalPaddingRatio),
            child: MyCardContainer(
              height: size.height * myCardHeightRatio,
            )),
        largeSpacer,
        Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * horizontalPaddingRatio * 1.5),
            child: ActionsContainer(
              height: size.height * actionsHeightRatio,
            )),
        largeSpacer,
        Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * horizontalPaddingRatio),
            child: const LastTransactionsListContainer(
              title: "Last transactions",
            )),
      ],
    );
  }
}
