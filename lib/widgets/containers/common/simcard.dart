import 'package:flutter/material.dart';

import '../../../painters/common/simcard.dart';

class SimcardContainer extends StatelessWidget {
  final double size;
  const SimcardContainer({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Transform myTransformer =
        context.findAncestorWidgetOfExactType<Transform>()!;
    return CustomPaint(
      painter: SimcardPainter(),
      size: Size.square(size),
    );
  }
}
