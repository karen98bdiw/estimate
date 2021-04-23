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
              fit: BoxFit.fill,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                top: 30,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    FormScreenTitle("Profile (designer)"),
                    RegisterScreenNumbers(actionNumber),
                    SizedBox(
                      height: 10,
                    ),
                    actions[actionNumber],
                    SizedBox(
                      height: 25,
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
                      buttonTitle:
                          actionNumber == actions.length - 1 ? "SAVE" : "NEXT",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
