import 'package:credit_card/widgets/containers/common/card_background.dart';
import 'package:credit_card/widgets/containers/common/light_blue_bar.dart';
import 'package:vector_math/vector_math_64.dart';
import 'package:flutter/material.dart';

import 'dark_blue_squares.dart';
import 'master_card.dart';
import 'simcard.dart';

class CardContainer extends StatelessWidget {
  final double height;
  const CardContainer({Key? key, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double aspectRatio = 1.4;
    double width = height * aspectRatio;
    double barheight = height * 0.075;
    Transform? myTransformer =
        context.findAncestorWidgetOfExactType<Transform>();
    Vector3 objectDepthAxis = Vector3(0, 0, 1);
    if (myTransformer != null) {
      objectDepthAxis = myTransformer.transform.transform3(objectDepthAxis);
    }
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CardBackground(
            width: width, height: height, objectDepthAxis: objectDepthAxis),
        Positioned(
            top: height * 0.2,
            left: width * 0.15,
            child: SimcardContainer(
                size: height * 0.3, objectdepthAxis: objectDepthAxis)),
        Positioned(
            top: height * 0.625,
            left: width * 0.1,
            child: DarkBlueSquaresContainer(
                width: barheight * 5,
                height: barheight,
                objectDepthAxis: objectDepthAxis)),
        Positioned(
            bottom: height * 0.2,
            left: width * 0.1,
            child: LightBlueBarContainer(
                height: barheight,
                width: width * 0.4,
                objectDepthAxis: objectDepthAxis)),
        Positioned(
            bottom: height * 0.15,
            right: width * 0.075,
            child: MasterCardContainer(
                height: height * 0.225, objectDepthAxis: objectDepthAxis))
      ],
    );
  }
}
