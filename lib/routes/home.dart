import 'package:credit_card/widgets/containers/common/app_bar.dart';
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
    double largeSpacerRatio = 0.05;
    double myCardHeightRatio = 0.25;
    double actionsHeightRatio = 0.1;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * horizontalPaddingRatio),
                  child: CustomAppBar(
                    height: appBarHeightRatio * size.height,
                    title: "Home",
                    width: size.width * (1 - 2 * horizontalPaddingRatio),
                  )),
              SizedBox(
                height: size.height * largeSpacerRatio,
              ),
              Padding(
                  padding: EdgeInsets.only(
                      left: size.width * horizontalPaddingRatio),
                  child: MyCardContainer(
                    height: size.height * myCardHeightRatio,
                  )),
              SizedBox(
                height: size.height * largeSpacerRatio,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * horizontalPaddingRatio * 1.5),
                  child: ActionsContainer(
                    height: size.height * actionsHeightRatio,
                  )),
              SizedBox(
                height: size.height * largeSpacerRatio,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * horizontalPaddingRatio),
                  child: const LastTransactionsListContainer()),
            ],
          ),
        ),
      ),
    );
  }
}
