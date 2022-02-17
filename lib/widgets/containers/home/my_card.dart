import 'package:credit_card/widgets/containers/common/card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyCardContainer extends StatelessWidget {
  final double height;
  const MyCardContainer({Key? key, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: height * 0.15,
          child: FittedBox(
              child: Text(
            "My Card",
            style: GoogleFonts.sora(
                color: Colors.black, fontWeight: FontWeight.w500),
          )),
        ),
        SizedBox(
          height: height * 0.05,
        ),
        SizedBox(
          height: height * 0.75,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              CardContainer(height: height * 0.7),
              SizedBox(
                width: size.width * 0.05,
              ),
              CardContainer(height: height * 0.7)
            ],
          ),
        )
      ],
    );
  }
}
