import 'package:credit_card/theme.dart';
import 'package:flutter/material.dart';

import 'textfield.dart';

class LoginFormContainer extends StatelessWidget {
  final double height;
  const LoginFormContainer({Key? key, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double textfieldHeight = 0.3 * height;
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
          TextfieldContainer(
              height: textfieldHeight,
              width: textfieldWidth,
              isPasswordField: true)
        ],
      ),
    );
  }
}
