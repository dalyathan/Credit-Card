import 'package:credit_card/widgets/containers/login/credit_card_3d.dart';
import 'package:flutter/material.dart';

import '../widgets/containers/login/form.dart';
import '../widgets/containers/login/header.dart';
import '../widgets/containers/login/no_account.dart';

class LoginRoute extends StatelessWidget {
  const LoginRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double creditCard3dHeightRatio = 0.225;
    double titleheightRatio = 0.075;
    double largeSpacerRatio = 0.125;
    double formHeightRatio = 0.375;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            CreditCard3DContainer(
                height: size.height * creditCard3dHeightRatio),
            SizedBox(
              height: size.height * largeSpacerRatio * 1.25,
            ),
            Center(
              child: LoginFormHead(
                height: size.height * titleheightRatio,
              ),
            ),
            SizedBox(
              height: size.height * largeSpacerRatio * 0.5,
            ),
            Center(
              child: LoginFormContainer(
                height: size.height * formHeightRatio,
              ),
            ),
            SizedBox(
              height: size.height * largeSpacerRatio * 0.25,
            ),
            Center(
              child: NoAccountContainer(
                height: size.height * 0.2,
              ),
            ),
          ],
        ),
      )),
    );
  }
}
