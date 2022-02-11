import 'package:credit_card/widgets/containers/common/card_background.dart';
import 'package:flutter/material.dart';

import 'simcard.dart';

class CardContainer extends StatelessWidget {
  final double width;
  const CardContainer({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double aspectRatio = 1.33;
    double height = width / aspectRatio;
    return Stack(
      children: [
        CardBackground(width: width, height: height),
        Positioned(
            top: height * 0.175,
            left: width * 0.15,
            child: SimcardContainer(
              size: width * 0.175,
            ))
      ],
    );
  }
}
