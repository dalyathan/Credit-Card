import 'package:credit_card/widgets/containers/common/blue_gradient_background.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../icons/in.dart';
import '../../icons/out.dart';

class TotalContainer extends StatelessWidget {
  final double amount;
  final double width;
  const TotalContainer({Key? key, required this.amount, required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double aspectRatio = 2;
    double height = width / aspectRatio;
    double borderRadiusRatio = 0.2;
    return ClipRRect(
      borderRadius:
          BorderRadius.all(Radius.circular(height * borderRadiusRatio)),
      child: BlueGradientContainer(
        width: width,
        height: height,
        content:
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          amount > 0
              ? OutIcon(height: height * 0.33)
              : InIcon(height: height * 0.33),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(
                flex: 2,
              ),
              SizedBox(
                height: height * 0.2,
                child: FittedBox(
                  fit: BoxFit.fitHeight,
                  child: Text(
                    amount > 0 ? "Income" : "Expenses",
                    style: GoogleFonts.sora(
                      color: Colors.white38,
                    ),
                  ),
                ),
              ),
              const Spacer(),
              SizedBox(
                height: height * 0.3,
                child: FittedBox(
                  fit: BoxFit.fitHeight,
                  child: Text(
                    "\$${amount.abs().toInt()}",
                    style: GoogleFonts.sora(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const Spacer(
                flex: 2,
              ),
            ],
          )
        ]),
      ),
    );
  }
}
