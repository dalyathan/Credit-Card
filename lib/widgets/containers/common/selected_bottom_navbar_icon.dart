import 'package:flutter/material.dart';

import '../../../theme.dart';

class ActiveBottomNavBarIcon extends StatelessWidget {
  final Widget icon;
  const ActiveBottomNavBarIcon({Key? key, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconTheme(
        data: const IconThemeData(color: MyTheme.darkBlue), child: icon);
  }
}
