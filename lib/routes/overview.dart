import 'package:flutter/material.dart';

import '../widgets/containers/common/app_bar.dart';
import '../widgets/containers/home/last_transactions_list.dart';
import '../widgets/containers/overview/total.dart';
import '../widgets/containers/overview/total_balance.dart';

class OverviewRoute extends StatelessWidget {
  const OverviewRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double appBarHeightRatio = 0.065;
    double horizontalPaddingRatio = 0.075;
    double totalBalanceHeightRatio = 0.4;
    double incomeExpenseWidthRatio = 0.35;
    SizedBox spacer = SizedBox(
      height: size.height * 0.025,
    );
    return Column(
      children: [
        Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * horizontalPaddingRatio),
            child: CustomAppBar(
              height: appBarHeightRatio * size.height,
              title: "Overview",
              width: size.width * (1 - 2 * horizontalPaddingRatio),
            )),
        spacer,
        TotalBalanceContainer(
          height: size.height * totalBalanceHeightRatio,
        ),
        spacer,
        Row(
          children: [
            const Spacer(
              flex: 5,
            ),
            TotalContainer(
              amount: 4322,
              width: size.width * incomeExpenseWidthRatio,
            ),
            const Spacer(),
            TotalContainer(
              amount: -322,
              width: size.width * incomeExpenseWidthRatio,
            ),
            const Spacer(
              flex: 5,
            ),
          ],
        ),
        spacer,
        Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * horizontalPaddingRatio),
            child: const LastTransactionsListContainer(
              title: "Transactions",
            )),
      ],
    );
  }
}
