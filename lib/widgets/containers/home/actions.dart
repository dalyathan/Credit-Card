import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../icons/exchange.dart';
import 'titled_icon.dart';

class ActionsContainer extends StatelessWidget {
  final double height;
  const ActionsContainer({Key? key, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TitledIconContainer(
          height: height,
          icon: Icon(Icons.add_rounded),
          title: 'Top Up',
        ),
        TitledIconContainer(
          height: height,
          icon: ExchangeIcon(),
          title: 'Transfer',
        ),
        TitledIconContainer(
          height: height,
          icon: Icon(Icons.history),
          title: 'History',
        )
      ],
    );
  }
}
