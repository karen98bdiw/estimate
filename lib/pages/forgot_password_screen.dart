import 'package:estimators_app/utils/constats.dart';
import 'package:estimators_app/utils/styles.dart';
import 'package:estimators_app/widgets/buttons.dart';
import 'package:estimators_app/widgets/helpers.dart';
import 'package:estimators_app/widgets/inputs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class ForgotPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
        backgroundColor: mainWhiteBackgroundColor,
        body: SafeArea(
          child: Stack(
            children: [
              SvgPicture.asset(
                "assets/images/linearBackground.svg",
                fit: BoxFit.cover,
              ),
              LayoutBuilder(
                builder: (c, cnst) => SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: cnst.maxWidth,
                      minHeight: cnst.maxHeight,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 30,
                      ),
                      child: Container(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            FormScreenTitle("Reset your password"),
                            Text(
                              "Enter the email address associated with your account and we'll send you a link to reset your password.",
                              style: mediumTextStyle(),
                            ),
                            CustomFormInput(
                              hint: "E-Mail",
                            ),
                            CustomBtn(
                              fill: false,
                              onClick: () {},
                              title: "Reset",
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  "Return to sign in",
                                  style: mediumTextStyle(color: blueShape),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
