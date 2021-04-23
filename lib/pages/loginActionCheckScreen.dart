import 'package:estimators_app/pages/login_screen.dart';
import 'package:estimators_app/pages/register_screen.dart';
import 'package:estimators_app/utils/constats.dart';
import 'package:estimators_app/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginActionCheckScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainWhiteBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height * 0.02),
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.64,
                child: SvgPicture.asset(
                  "assets/images/loginActionScreenCenterLeftClip.svg",
                  fit: BoxFit.fill,
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: SvgPicture.asset(
                  "assets/images/loginActionScreenTopLeftClip.svg",
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.45,
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: SvgPicture.asset(
                    "assets/images/loginActionScreenTopRightClip.svg"),
              ),
              Align(
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  "assets/images/inAppLogo.svg",
                  height: MediaQuery.of(context).size.height * 0.14,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Estimate Your Project \n With Our Estimators",
                        style: TextStyle(
                          color: blueShape,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      CustomBtn(
                        title: "Sign In",
                        onClick: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (c) => LoginScreen(),
                          ));
                        },
                        fill: true,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      CustomBtn(
                        color: Colors.transparent,
                        outlined: true,
                        title: "Sign Up",
                        onClick: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (c) => RegisterScreen(),
                            ),
                          );
                        },
                        fill: true,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
