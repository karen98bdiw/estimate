import 'package:estimators_app/utils/country.dart';
import 'package:estimators_app/widgets/country_code_picker.dart';
import 'package:estimators_app/widgets/inputPrefixes.dart';
import 'package:estimators_app/widgets/inputs.dart';
import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Container(
      child: LayoutBuilder(
        builder: (c, cn) => SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: cn.maxWidth,
              minHeight: cn.maxHeight,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomFormInput(
                  hint: "Full name",
                  prefix: userPrefix,
                ),
                CustomFormInput(
                  hint: "Last name",
                  prefix: userPrefix,
                ),
                CustomFormInput(
                  hint: "Phone Number",
                  prefix: GestureDetector(
                    child:
                        Text(pickerCountry.flag + " " + pickerCountry.dialCode),
                    onTap: () async {
                      var res = await countyPickerDialog(context: context);
                      setState(() {
                        pickerCountry = res ?? pickerCountry;
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
