import 'package:credit_card/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginFormHead extends StatelessWidget {
  final double height;
  const LoginFormHead({Key? key, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: SizedBox(
        height: height,
        width: size.width * 0.8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Spacer(
                  flex: 3,
                ),
                Text(
                  "Your",
                  style: GoogleFonts.sora(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(
                  flex: 1,
                ),
                Text(
                  "Credit Card",
                  style: GoogleFonts.sora(
                      color: MyTheme.lightBlue,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(
                  flex: 3,
                ),
              ],
            ),
            Text(
              "Enter your username and password",
              style: GoogleFonts.sora(color: Colors.black, fontSize: 15),
            )
          ],
        ),
      ),
    );
  }
}
