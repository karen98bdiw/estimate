import 'package:estimators_app/pages/loginActionCheckScreen.dart';
import 'package:estimators_app/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:estimators_app/utils/constats.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainWhiteBackgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: SvgPicture.asset("assets/images/intorTopLeftClip.svg"),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: SvgPicture.asset(
                  "assets/images/introScreenBottomRightClip.svg"),
            ),
            Align(
              alignment: Alignment.center,
              child: SvgPicture.asset("assets/images/inAppLogo.svg"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomBtn(
                        title: "Click to start",
                        onClick: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (c) => LoginActionCheckScreen(),
                            ),
                          );
                        },
                        fill: true,
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
