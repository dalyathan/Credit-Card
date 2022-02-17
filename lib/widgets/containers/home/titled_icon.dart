import 'package:credit_card/widgets/containers/common/custom_icon.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitledIconContainer extends StatelessWidget {
  final double height;
  final Widget icon;
  final String title;
  const TitledIconContainer(
      {Key? key, required this.height, required this.icon, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => print("ayyay"),
      child: SizedBox(
        height: height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomIcon(size: height * 0.6, icon: icon),
            SizedBox(
                height: height * 0.3,
                child: FittedBox(
                    fit: BoxFit.fitHeight,
                    child: Text(title, style: GoogleFonts.sora())))
          ],
        ),
      ),
    );
  }
}
