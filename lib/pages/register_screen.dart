import 'package:estimators_app/pages/register_advanced.dart';
import 'package:estimators_app/utils/constats.dart';
import 'package:estimators_app/widgets/buttons.dart';
import 'package:estimators_app/widgets/inputs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainWhiteBackgroundColor,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (c, cnst) => SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: cnst.maxWidth,
                minHeight: cnst.maxHeight,
              ),
              child: Stack(
                children: [
                  SvgPicture.asset("assets/images/roundedAppBarClip.svg"),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 30,
                    ),
                    child: Container(
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: SvgPicture.asset(
                              "assets/images/inAppLogo.svg",
                              width: 32,
                              height: 36,
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 18,
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    "Sign Up",
                                    style: TextStyle(
                                      color: blueShape,
                                      fontSize: 26,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "Add your details to sign up",
                                    style: TextStyle(
                                      color: blueShape,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  _form(),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  CustomBtn(
                                    fill: true,
                                    color: blueShape,
                                    onClick: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (c) =>
                                              AdvancedRegisterScreen(),
                                        ),
                                      );
                                    },
                                    title: "Sing Up",
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _form() => Form(
          child: Column(
        children: [
          CustomFormInput(
            prefix: SvgPicture.asset("assets/icons/emailPrefix.svg"),
            hint: "Your Email",
          ),
          SizedBox(
            height: 10,
          ),
          CustomFormInput(
            prefix: SvgPicture.asset("assets/icons/passwordPrefix.svg"),
            obscureText: true,
            hint: "Password",
          ),
          SizedBox(
            height: 10,
          ),
          CustomFormInput(
            prefix: SvgPicture.asset("assets/icons/passwordPrefix.svg"),
            obscureText: true,
            hint: "Confirm Password",
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "By continuing, you agree to out \nTerms of Service & Privacy Policy",
            textAlign: TextAlign.start,
            style: TextStyle(
              color: blueShape,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ));
}
