import 'package:auto_size_text/auto_size_text.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:estimators_app/pages/info_registring_screens.dart';
import 'package:estimators_app/utils/constats.dart';
import 'package:estimators_app/utils/country.dart';
import 'package:estimators_app/utils/enums.dart';
import 'package:estimators_app/utils/styles.dart';
import 'package:estimators_app/widgets/apply_picker.dart';
import 'package:estimators_app/widgets/buttons.dart';
import 'package:estimators_app/widgets/country_picker.dart';
import 'package:estimators_app/widgets/inputs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import '../widgets/helpers.dart';

class AdvancedRegisterScreen extends StatefulWidget {
  @override
  _AdvancedRegisterScreenState createState() => _AdvancedRegisterScreenState();
}

class _AdvancedRegisterScreenState extends State<AdvancedRegisterScreen> {
  bool obscurePassword = true;

  bool obscureRepeatPassword = true;
  bool isAgreeWithAgreement = false;
  bool isClient = false;
  bool isTallent = false;

  CountryAndFlags pickerCountry = CountryAndFlags(
    name: "Armenia",
    flag: "🇦🇲",
    code: "AM",
    dialCode: "+374",
  );

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: Scaffold(
        backgroundColor: mainWhiteBackgroundColor,
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: Stack(
            children: [
              SvgPicture.asset(
                "assets/images/linearBackground.svg",
                fit: BoxFit.fill,
              ),
              Padding(
                padding: formScaffoldPadding,
                child: LayoutBuilder(
                  builder: (c, cn) => SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minWidth: cn.maxWidth,
                        minHeight: cn.maxHeight,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          _checkAction(),
                          bottom(),
                        ],
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
                  MaterialPageRoute(builder: (c) => InfoRegistringScreen()));
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
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Apply as",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Container(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                isClient = !isClient;
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              decoration: BoxDecoration(
                                color: blueShape,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(
                                "Client",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        TitledCheckBox(
                          showTitle: false,
                          onChanged: (v) {
                            setState(() {
                              isClient = v;
                            });
                          },
                          value: isClient,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () async {
                              var res = await applyPicker(context: context);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              decoration: BoxDecoration(
                                color: mainBtnColor,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Tallent",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  SvgPicture.asset(
                                    "assets/icons/dropDownIcon.svg",
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        TitledCheckBox(
                          showTitle: false,
                          onChanged: (v) {
                            setState(() {
                              isTallent = v;
                            });
                          },
                          value: isTallent,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );

  // Widget _checkAction() => Container(
  //       child: Column(
  //         children: [
  //           Text(
  //             "I want to",
  //             style: TextStyle(
  //               fontWeight: FontWeight.w700,
  //               fontSize: 18,
  //             ),
  //           ),
  //           SizedBox(
  //             height: 10,
  //           ),
  //           Row(
  //             mainAxisSize: MainAxisSize.min,
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Container(
  //                 width: MediaQuery.of(context).size.width * 0.40,
  //                 height: MediaQuery.of(context).size.height * 0.045,
  //                 padding: EdgeInsets.all(7),
  //                 child: AutoSizeText(
  //                   "Estimate Project",
  //                   textAlign: TextAlign.center,
  //                   style: mediumTextStyle(
  //                     color: Colors.black,
  //                   ),
  //                 ),
  //                 decoration: BoxDecoration(
  //                   border: Border.all(
  //                     color: Color.fromRGBO(1, 97, 137, 1),
  //                   ),
  //                   borderRadius: BorderRadius.only(
  //                     topLeft: Radius.circular(7),
  //                     bottomLeft: Radius.circular(7),
  //                   ),
  //                 ),
  //               ),
  //               Container(
  //                 height: MediaQuery.of(context).size.height * 0.11,
  //                 width: 3,
  //                 color: Color.fromRGBO(1, 97, 137, 1),
  //               ),
  //               Container(
  //                 width: MediaQuery.of(context).size.width * 0.40,
  //                 height: MediaQuery.of(context).size.height * 0.045,
  //                 margin: EdgeInsets.only(
  //                     top: MediaQuery.of(context).size.height * 0.045),
  //                 padding: EdgeInsets.all(7),
  //                 child: Row(
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   children: [
  //                     AutoSizeText(
  //                       "Be Partner",
  //                       style: mediumTextStyle(color: Colors.black),
  //                     ),
  //                     SizedBox(
  //                       width: 7,
  //                     ),
  //                     SvgPicture.asset(
  //                       "assets/icons/dropDownIcon.svg",
  //                     ),
  //                   ],
  //                 ),
  //                 decoration: BoxDecoration(
  //                   border: Border.all(
  //                     color: Color.fromRGBO(1, 97, 137, 1),
  //                   ),
  //                   borderRadius: BorderRadius.only(
  //                     topRight: Radius.circular(7),
  //                     bottomRight: Radius.circular(7),
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ],
  //       ),
  //     );

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
