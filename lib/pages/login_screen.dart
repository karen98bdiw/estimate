import 'package:estimators_app/utils/constats.dart';
import 'package:estimators_app/widgets/buttons.dart';
import 'package:estimators_app/widgets/helpers.dart';
import 'package:estimators_app/widgets/inputs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class LoginScreen extends StatelessWidget {
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
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  top: 18,
                                ),
                                child: Column(
                                  children: [
                                    FormScreenTitle("Sign In"),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "Add your details to login",
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
                                      height: 10,
                                    ),
                                    Text(
                                      "Forgot your password?",
                                      style: TextStyle(
                                        color: blueShape,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    _availiableLoginServices(),
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
              ),
            ],
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
            height: 26,
          ),
          CustomFormInput(
            prefix: SvgPicture.asset("assets/icons/passwordPrefix.svg"),
            obscureText: true,
            hint: "Password",
          ),
          SizedBox(
            height: 26,
          ),
          CustomBtn(
            fill: true,
            onClick: () {},
            title: "Login",
          ),
        ],
      ));

  Widget _availiableLoginServices() => Column(
        children: [
          CustomBtn(
            color: blueShape,
            title: "Login With Linkedin",
            onClick: () {},
            icon: SvgPicture.asset(
              "assets/images/linkedinIcon.svg",
            ),
          ),
          SizedBox(
            height: 15,
          ),
          CustomBtn(
            onClick: () {},
            title: "Login With Google",
            fill: true,
            icon: SvgPicture.asset("assets/images/googlePlusIcon.svg"),
          )
        ],
      );
}
