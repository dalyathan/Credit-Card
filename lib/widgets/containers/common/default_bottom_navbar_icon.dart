import 'package:flutter/material.dart';

class DefaultBottomNavBarIcon extends StatelessWidget {
  final Widget icon;
  const DefaultBottomNavBarIcon({Key? key, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconTheme(
        data: const IconThemeData(color: Color.fromRGBO(161, 167, 187, 1)),
        child: icon);
  }
}
