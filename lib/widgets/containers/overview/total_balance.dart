import 'package:credit_card/widgets/containers/common/blue_gradient_background.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'dollar.dart';

class TotalBalanceContainer extends StatelessWidget {
  final double height;
  const TotalBalanceContainer({Key? key, required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.center,
      children: [
        BlueGradientContainer(width: size.width, height: height),
        Column(
          children: [
            DollarContainer(
              radius: height * 0.2,
            ),
            SizedBox(
              height: height * 0.1,
            ),
            SizedBox(
                width: size.width * 0.3,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    "\$3,228",
                    style: GoogleFonts.sora(
                      color: Colors.white,
                    ),
                  ),
                )),
            SizedBox(
              height: height * 0.025,
            ),
            SizedBox(
                width: size.width * 0.225,
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    "Total Balance",
                    style: GoogleFonts.sora(
                      color: Colors.white54,
                    ),
                  ),
                ))
          ],
        )
      ],
    );
  }
}
