import 'package:flutter/material.dart';

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
          iconData: Icons.add_rounded,
          title: 'Top Up',
        ),
        TitledIconContainer(
          height: height,
          iconData: Icons.add_rounded,
          title: 'Top Up',
        ),
        TitledIconContainer(
          height: height,
          iconData: Icons.add_rounded,
          title: 'Top Up',
        )
      ],
    );
  }
}
