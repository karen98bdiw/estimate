import 'package:auto_size_text/auto_size_text.dart';
import 'package:estimators_app/pages/login_screen.dart';
import 'package:estimators_app/pages/register_advanced.dart';
import 'package:estimators_app/pages/register_screen.dart';
import 'package:estimators_app/utils/constats.dart';
import 'package:estimators_app/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginActionCheckScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: formScaffoldPadding,
          child: LayoutBuilder(
            builder: (c, cn) => SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                    minHeight: cn.maxHeight, minWidth: cn.maxWidth),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    top(context),
                    buttons(context),
                    bottom(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buttons(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomBtn(
            color: blueShape,
            title: "Get Started",
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
            textColor: mainBtnColor,
            outlineColor: mainBtnColor,
            outlined: true,
            title: "Sign Up",
            onClick: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (c) => AdvancedRegisterScreen(),
                ),
              );
            },
            fill: true,
          ),
        ],
      );

  Widget top(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Container(
                  height: 40,
                  alignment: Alignment.bottomLeft,
                  child: AutoSizeText(
                    "ESTIMATORS",
                    style: TextStyle(
                      color: blueShape,
                      fontSize: 40,
                      height: 1,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.25,
                height: MediaQuery.of(context).size.height * 0.15,
                child: Image.asset(
                  "assets/images/logo.gif",
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            "The Perfect Space for Project Estimating",
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
            textAlign: TextAlign.start,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "ESTIMATORS is the world’s most powerful relationship and workflow managment tool",
            style: TextStyle(
              fontSize: 17,
              color: Colors.black,
            ),
          ),
        ],
      );

  Widget bottom() => RichText(
        text: TextSpan(children: [
          TextSpan(
            text:
                "By Proceeding you acknowledge that you have read, understood and agree to our",
            style: TextStyle(
              fontSize: 17,
              color: Colors.black,
            ),
          ),
          WidgetSpan(
            child: GestureDetector(
              child: Text(
                "Terms and Conditions",
                style: TextStyle(
                  fontSize: 17,
                  color: blueShape,
                  decoration: TextDecoration.underline,
                ),
              ),
              onTap: () {},
            ),
          ),
        ]),
      );
}
