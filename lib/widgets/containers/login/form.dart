import 'package:credit_card/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'button.dart';
import 'textfield.dart';

class LoginFormContainer extends StatelessWidget {
  final double height;
  const LoginFormContainer({Key? key, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double textfieldHeight = 0.2 * height;
    double textfieldWidth = size.width * 0.8;
    return SizedBox(
      height: height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          TextfieldContainer(
            height: textfieldHeight,
            width: textfieldWidth,
          ),
          const Spacer(
            flex: 2,
          ),
          TextfieldContainer(
              height: textfieldHeight,
              width: textfieldWidth,
              isPasswordField: true),
          const Spacer(
            flex: 1,
          ),
          SizedBox(
            width: size.width * 0.8,
            height: height * 0.05,
            child: Align(
              alignment: Alignment.topRight,
              child: FittedBox(
                fit: BoxFit.fitHeight,
                child: Text(
                  "Forgot Password?",
                  style: GoogleFonts.sora(
                      decoration: TextDecoration.underline,
                      color: MyTheme.darkBlue,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
          const Spacer(
            flex: 5,
          ),
          LoginButton(
            height: textfieldHeight * 0.9,
            width: textfieldWidth,
          )
        ],
      ),
    );
  }
}
