import 'package:flutter/material.dart';

import '../../painters/home/exchange.dart';

class ExchangeIcon extends StatelessWidget {
  //final double size;
  const ExchangeIcon({
    Key? key,
    //required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      //size: Size.square(size),
      painter: ExchangeIconPainter(),
    );
  }
}
