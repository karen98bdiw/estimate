import 'package:estimators_app/models/register_request_model.dart';
import 'package:estimators_app/pages/additional_info_screen.dart';
import 'package:estimators_app/pages/personal_info_screen.dart';
import 'package:estimators_app/utils/constats.dart';
import 'package:estimators_app/widgets/buttons.dart';
import 'package:estimators_app/widgets/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class InfoRegistringScreen extends StatefulWidget {
  final bool isClient;
  final RegisterRequestModel model;

  InfoRegistringScreen({
    this.isClient,
    this.model,
  });

  @override
  _InfoRegistringScreenState createState() => _InfoRegistringScreenState();
}

class _InfoRegistringScreenState extends State<InfoRegistringScreen> {
  int actionNumber = 0; //will controll the number of reg screen;
  bool someValue = false;

  var actions;

  @override
  void initState() {
    actions = [
      if (!widget.isClient)
        AddintionalInfo(
          model: widget.model,
        ),
      PersonalInfo(
        model: widget.model,
        isClient: widget.isClient,
      ),
    ];

    super.initState();
  }

  void onSave() {
    PersonalInfo.personalInfoStateKey.currentState.onSave();
  }

  void onAdditionalInfoSave() {
    AddintionalInfo.additionalInfoState.currentState.onSave();
  }

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
                fit: BoxFit.fill,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  top: 30,
                  bottom: 10,
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
                        } else {
                          Navigator.of(context).pop();
                        }
                      },
                      onButtonClick: () {
                        if (actionNumber < actions.length - 1) {
                          setState(() {
                            onAdditionalInfoSave();
                            actionNumber++;
                          });
                        } else {
                          onSave();
                        }
                      },
                      buttonTitle:
                          actionNumber == actions.length - 1 ? "SAVE" : "NEXT",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget top() => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FormScreenTitle("Profile (${widget.isClient ? "Client" : "Talent"})"),
          if (!widget.isClient) RegisterScreenNumbers(actionNumber),
        ],
      );
}
