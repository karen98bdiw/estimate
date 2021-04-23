import 'package:auto_size_text/auto_size_text.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:estimators_app/pages/profile_designer_screen.dart';
import 'package:estimators_app/utils/constats.dart';
import 'package:estimators_app/utils/country.dart';
import 'package:estimators_app/utils/enums.dart';
import 'package:estimators_app/widgets/buttons.dart';
import 'package:estimators_app/widgets/country_code_picker.dart';
import 'package:estimators_app/widgets/inputs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/helpers.dart';

class AdvancedRegisterScreen extends StatefulWidget {
  @override
  _AdvancedRegisterScreenState createState() => _AdvancedRegisterScreenState();
}

class _AdvancedRegisterScreenState extends State<AdvancedRegisterScreen> {
  bool obscurePassword = true;

  bool obscureRepeatPassword = true;
  bool isAgreeWithAgreement = false;

  CountryAndFlags pickerCountry = CountryAndFlags(
    name: "Armenia",
    flag: "🇦🇲",
    code: "AM",
    dialCode: "+374",
  );

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
              padding: formScaffoldPadding,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Sign Up",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 24,
                        color: titleColor,
                      ),
                    ),
                    _form(),
                    SizedBox(
                      height: 20,
                    ),
                    _checkAction(),
                    SizedBox(
                      height: 10,
                    ),
                    bottom(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget bottom() => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          agreement(),
          SizedBox(
            height: 15,
          ),
          CustomBtn(
            title: "Sign Up",
            onClick: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (c) => ProfileDesignerScreen()));
            },
          ),
          SizedBox(
            height: 5,
          ),
          MoveToSignType(
            toType: SignType.Sign,
          ),
        ],
      );

  Widget _checkAction() => Container(
        child: Column(
          children: [
            Text(
              "I want to",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.045,
                  padding: EdgeInsets.all(7),
                  child: AutoSizeText(
                    "Estimate Project",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromRGBO(1, 97, 137, 1),
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(7),
                      bottomLeft: Radius.circular(7),
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.11,
                  width: 3,
                  color: Color.fromRGBO(1, 97, 137, 1),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.045,
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.045),
                  padding: EdgeInsets.all(7),
                  child: Row(
                    children: [
                      AutoSizeText(
                        "Be Partner",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      SvgPicture.asset(
                        "assets/icons/dropDownIcon.svg",
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromRGBO(1, 97, 137, 1),
                    ),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(7),
                      bottomRight: Radius.circular(7),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );

  Widget _form() => Column(
        children: [
          CustomFormInput(
            hint: "Email",
            prefix: SvgPicture.asset(
              "assets/icons/emailPrefix.svg",
            ),
          ),
          CustomFormInput(
            hint: "Phone Number",
            prefix: GestureDetector(
              child: Text(pickerCountry.flag + " " + pickerCountry.dialCode),
              onTap: () async {
                var res = await countyPickerDialog(context: context);
                setState(() {
                  pickerCountry = res ?? pickerCountry;
                });
              },
            ),
          ),
          CustomFormInput(
            hint: "Create Password",
            obscureText: obscurePassword,
            prefix: SvgPicture.asset(
              "assets/icons/passwordPrefix.svg",
            ),
            sufix: GestureDetector(
              onTap: () {
                setState(() {
                  obscurePassword = !obscurePassword;
                });
              },
              child: SvgPicture.asset("assets/icons/passwordSuffix.svg"),
            ),
          ),
          CustomFormInput(
            obscureText: obscureRepeatPassword,
            sufix: GestureDetector(
              onTap: () {
                setState(() {
                  obscureRepeatPassword = !obscureRepeatPassword;
                });
              },
              child: SvgPicture.asset("assets/icons/passwordSuffix.svg"),
            ),
            hint: "Repeate Password",
            prefix: SvgPicture.asset(
              "assets/icons/passwordPrefix.svg",
            ),
          ),
        ],
      );

  Widget agreement() => Container(
        height: MediaQuery.of(context).size.height * 0.05,
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  isAgreeWithAgreement = !isAgreeWithAgreement;
                });
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.025,
                width: MediaQuery.of(context).size.height * 0.025,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: mainBorderColor),
                ),
                child: isAgreeWithAgreement
                    ? Center(
                        child: SvgPicture.asset(
                          "assets/icons/doneIcon.svg",
                        ),
                      )
                    : Container(),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: AutoSizeText(
                "I agree to Estimate’s Terms & Conditions and Privacy Policy ",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      );
}
