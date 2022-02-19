import 'package:credit_card/theme.dart';
import 'package:credit_card/widgets/containers/common/blue_gradient_background.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DollarContainer extends StatelessWidget {
  final double radius;
  const DollarContainer({Key? key, required this.radius}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double borderWidthRatio = 0.2;
    double outerRingRadis = radius * 2;
    double innerRingRadius = radius * (2 - borderWidthRatio);
    double dollarSignCircleDiameter = innerRingRadius * 0.865;
    double dollarIconheight = dollarSignCircleDiameter * 0.95;
    return Container(
      width: radius * 2,
      height: radius * 2,
      decoration: BoxDecoration(
        border: Border.all(
            color: MyTheme.lightBlue, width: outerRingRadis - innerRingRadius),
        shape: BoxShape.circle,
      ),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Container(
            width: innerRingRadius,
            height: innerRingRadius,
            decoration: const BoxDecoration(
                color: Colors.black87, shape: BoxShape.circle),
          ),
          ClipRRect(
            borderRadius: BorderRadius.all(
                Radius.circular(dollarSignCircleDiameter * 0.5)),
            child: BlueGradientContainer(
              width: dollarSignCircleDiameter,
              height: dollarSignCircleDiameter,
              content: Align(
                alignment: const Alignment(0.2, 0.0),
                child: Stack(clipBehavior: Clip.none, children: [
                  Positioned(
                    left: -dollarIconheight * 0.15,
                    bottom: -dollarIconheight * 0.15,
                    child: SizedBox(
                      height: innerRingRadius,
                      child: FittedBox(
                          fit: BoxFit.fitHeight,
                          child: Text(
                            "\$",
                            style: GoogleFonts.lexendExa(
                                color: const Color.fromRGBO(37, 50, 80, 1),
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: innerRingRadius,
                    child: FittedBox(
                        fit: BoxFit.fitHeight,
                        child: Text(
                          "\$",
                          style: GoogleFonts.lexendExa(
                              color: MyTheme.lightBlue,
                              fontWeight: FontWeight.bold),
                        )),
                  )
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
