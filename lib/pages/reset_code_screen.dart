import 'package:estimators_app/utils/constats.dart';
import 'package:estimators_app/utils/styles.dart';
import 'package:estimators_app/widgets/buttons.dart';
import 'package:estimators_app/widgets/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ResetCodeScreen extends StatefulWidget {
  @override
  _ResetCodeScreenState createState() => _ResetCodeScreenState();
}

class _ResetCodeScreenState extends State<ResetCodeScreen> {
   String code = "";

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
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            FormScreenTitle("Enter Security Code"),
                            Text(
                              "Please check your email for a message with your code. Your code is 6 numbers long.",
                              style: mediumTextStyle(),
                            ),
                            PinCodeTextField(
                              textInputType: TextInputType.number,
                              backgroundColor: Colors.transparent,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              length: 6,
                              animationType: AnimationType.fade,
                              pinTheme: PinTheme(
                                activeColor: mainBtnColor,
                                inactiveColor: Colors.grey,
                                inactiveFillColor: Colors.grey[200],
                                selectedColor: mainBtnColor,
                                selectedFillColor: mainBtnColor,
                                shape: PinCodeFieldShape.box,
                                borderRadius: BorderRadius.circular(5),
                                fieldHeight: 50,
                                fieldWidth: 40,
                                activeFillColor: Colors.white,
                              ),
                              animationDuration: Duration(milliseconds: 300),
                              enableActiveFill: true,
                              onCompleted: (v) {},
                              onChanged: (value) {
                                code = value;
                              },
                              beforeTextPaste: (text) {
                                return true;
                              },
                            ),
                            CustomBtn(
                              fill: false,
                              onClick: () {
                                print(code);
                              },
                              title: "Submit",
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  "Didn't get a code?",
                                  style: mediumTextStyle(color: blueShape),
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
}

class CustomCodeItem extends StatelessWidget {
  final String char;
  final bool fieldFocused;
  final bool itemFocused;

  const CustomCodeItem({
    Key key,
    this.char: '',
    this.fieldFocused: false,
    this.itemFocused: false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 42.0,
      height: 42.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.0),
        color: fieldFocused
            ? (itemFocused ? Colors.grey : Colors.grey.withOpacity(0.5))
            : Colors.grey.withOpacity(0.25),
        border: Border.all(color: itemFocused ? Colors.black : Colors.grey),
      ),
      child: Center(
        child: Text(
          char,
          style: Theme.of(context).primaryTextTheme.headline4,
        ),
      ),
    );
  }
}
