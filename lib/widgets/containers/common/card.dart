import 'package:credit_card/widgets/containers/common/card_background.dart';
import 'package:credit_card/widgets/containers/common/light_blue_bar.dart';
import 'package:vector_math/vector_math_64.dart';
import 'package:flutter/material.dart';

import 'dark_blue_squares.dart';
import 'simcard.dart';
import 'dart:math';

class CardContainer extends StatelessWidget {
  final double width;
  const CardContainer({Key? key, required this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double aspectRatio = 1.4;
    double height = width / aspectRatio;
    double barheight = height * 0.075;
    Transform? myTransformer =
        context.findAncestorWidgetOfExactType<Transform>();
    Vector3 objectDepthAxis = Vector3(0, 0, 1);
    if (myTransformer != null) {
      objectDepthAxis = myTransformer.transform.transform3(objectDepthAxis);
    }
    return Stack(
      children: [
        CardBackground(
            width: width, height: height, objectDepthAxis: objectDepthAxis),
        Positioned(
            top: height * 0.175,
            left: width * 0.15,
            child: SimcardContainer(
                size: width * 0.175, objectdepthAxis: objectDepthAxis)),
        Positioned(
            top: height * 0.6,
            left: width * 0.1,
            child: DarkBlueSquaresContainer(
                width: barheight * 5,
                height: barheight,
                objectDepthAxis: objectDepthAxis)),
        Positioned(
            top: height * 0.75,
            left: width * 0.1,
            child: LightBlueBarContainer(
                height: barheight,
                width: width * 0.4,
                objectDepthAxis: objectDepthAxis))
      ],
    );
  }
}
