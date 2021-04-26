import 'package:estimators_app/pages/additional_info_screen.dart';
import 'package:estimators_app/pages/personal_info_screen.dart';
import 'package:estimators_app/utils/constats.dart';
import 'package:estimators_app/utils/styles.dart';
import 'package:estimators_app/widgets/buttons.dart';
import 'package:estimators_app/widgets/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileDesignerScreen extends StatefulWidget {
  @override
  _ProfileDesignerScreenState createState() => _ProfileDesignerScreenState();
}

class _ProfileDesignerScreenState extends State<ProfileDesignerScreen> {
  int actionNumber = 0; //will controll the number of reg screen;
  bool someValue = false;

  var actions = [
    AddintionalInfo(),
    PersonalInfo(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainWhiteBackgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            SvgPicture.asset(
              "assets/images/roundedAppBarClip.svg",
              width: MediaQuery.of(context).size.width,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                top: 30,
                bottom: 10,
              ),
              child: LayoutBuilder(
                builder: (c, cn) => ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: cn.maxWidth,
                    maxHeight: cn.maxHeight,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      top(),
                      Expanded(
                        child: actions[actionNumber],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ScreenActionChangeButton(
                        onBackButtonClick: () {
                          if (actionNumber - 1 > -1) {
                            setState(() {
                              actionNumber--;
                            });
                          }
                        },
                        onButtonClick: () {
                          if (actionNumber < actions.length - 1) {
                            setState(() {
                              actionNumber++;
                            });
                          }
                        },
                        buttonTitle: actionNumber == actions.length - 1
                            ? "SAVE"
                            : "NEXT",
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget top() => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FormScreenTitle("Profile (designer)"),
          RegisterScreenNumbers(actionNumber),
        ],
      );
}
