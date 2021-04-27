import 'package:estimators_app/utils/country.dart';
import 'package:estimators_app/widgets/country_picker.dart';
import 'package:estimators_app/widgets/helpers.dart';
import 'package:estimators_app/widgets/inputPrefixes.dart';
import 'package:estimators_app/widgets/inputs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PersonalInfo extends StatefulWidget {
  @override
  _PersonalInfoState createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  CountryAndFlags pickerCountry = CountryAndFlags(
    name: "Armenia",
    flag: "🇦🇲",
    code: "AM",
    dialCode: "+374",
  );

  bool isCopmany = true; //or individual
  bool isIndividual = false;

  final countryController = TextEditingController();
  final scroll = ScrollController();

  @override
  void dispose() {
    countryController.dispose();
    super.dispose();
  }

  var key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      // resizeToAvoidBottomInset: true,
      // resizeToAvoidBottomPadding: true,
      child: LayoutBuilder(
        builder: (c, cn) => SingleChildScrollView(
          controller: scroll,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: cn.maxWidth,
              minHeight: cn.maxHeight,
            ),
            child: Form(
              key: key,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  checkAccauntTarget(),
                  CustomFormInput(
                    hint: "First name",
                    prefix: userPrefix,
                  ),
                  CustomFormInput(
                    hint: "Last name",
                    prefix: userPrefix,
                  ),
                  CustomFormInput(
                    controller: countryController,
                    hint: "Country",
                    sufix: GestureDetector(
                      child: GestureDetector(
                        child:
                            SvgPicture.asset("assets/icons/dropDownIcon.svg"),
                        onTap: () async {
                          var res = await countyPickerDialog(context: context);
                          setState(() {
                            pickerCountry = res ?? pickerCountry;
                            countryController.clear();
                            countryController.text = pickerCountry.name;
                          });
                        },
                      ),
                    ),
                    prefix: GestureDetector(
                      child: Text(pickerCountry.flag),
                      onTap: () async {
                        var res = await countyPickerDialog(context: context);
                        setState(() {
                          pickerCountry = res ?? pickerCountry;
                          countryController.text = pickerCountry.name;
                        });
                      },
                    ),
                  ),
                  Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: CustomFormInput(
                          hint: "State",
                          textCentered: true,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        flex: 2,
                        child: CustomFormInput(
                          hint: "City",
                          prefix: locationPrefix,
                        ),
                      ),
                    ],
                  ),
                  CustomFormInput(
                    hint: "Street adress",
                    prefix: adressPrefix,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomFormInput(
                          prefix: buildingPrefix,
                          hint: "Apt/Suite",
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: CustomFormInput(
                          hint: "Zip code",
                          prefix: zipPrefix,
                        ),
                      ),
                    ],
                  ),
                  SocialAdressInput(
                    prefix: linkedinPrefix,
                  ),
                  SocialAdressInput(
                    prefix: behancePrefix,
                  ),
                  SocialAdressInput(
                    prefix: dribblePrefix,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget checkAccauntTarget() => Container(
        child: Row(
          children: [
            Expanded(
              child: TitledRadioButton(
                title: "Company",
                value: isCopmany,
                onChanged: (v) {
                  setState(() {
                    isCopmany = v;
                  });
                },
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: TitledRadioButton(
                title: "Individual",
                value: !isCopmany,
                onChanged: (v) {
                  setState(() {
                    isCopmany = !v;
                  });
                },
              ),
            ),
          ],
        ),
      );
}
