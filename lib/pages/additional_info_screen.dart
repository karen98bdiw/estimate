import 'package:flutter/material.dart';
import 'package:estimators_app/utils/constats.dart';
import 'package:estimators_app/utils/styles.dart';
import 'package:estimators_app/widgets/helpers.dart';

class AddintionalInfo extends StatefulWidget {
  @override
  _AddintionalInfoState createState() => _AddintionalInfoState();
}

class _AddintionalInfoState extends State<AddintionalInfo> {
  bool someValue = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        designTypeCheckView(
            onItemSize: MediaQuery.of(context).size.width * 0.30),
        SizedBox(
          height: 10,
        ),
        skillsCheckView(),
        SizedBox(
          height: 10,
        ),
        seniorityLevelCheck(
            onItemSize: MediaQuery.of(context).size.width * 0.45),
        SizedBox(
          height: 10,
        ),
        workMission(onItemSize: MediaQuery.of(context).size.width * 0.3),
      ],
    );
  }

  Widget designTypeCheckView({double onItemSize}) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "What type of design you do?",
            style: mediumTextStyle(color: lightBlue),
            textAlign: TextAlign.start,
          ),
          SizedBox(
            height: 16,
          ),
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            runSpacing: 17,
            children: [
              Container(
                width: onItemSize,
                child: TitledCheckBox(
                  value: someValue,
                  title: "Web",
                  onChanged: (v) {
                    setState(() {
                      someValue = v;
                      print(v);
                    });
                  },
                ),
              ),
              Container(
                width: onItemSize,
                child: TitledCheckBox(
                  value: someValue,
                  title: "Industrial",
                  onChanged: (v) {
                    setState(() {
                      someValue = v;
                      print(v);
                    });
                  },
                ),
              ),
              Container(
                width: onItemSize,
                child: TitledCheckBox(
                  value: someValue,
                  title: "Graphic",
                  onChanged: (v) {
                    setState(() {
                      someValue = v;
                      print(v);
                    });
                  },
                ),
              ),
              Container(
                width: onItemSize,
                child: TitledCheckBox(
                  value: someValue,
                  title: "3D",
                  onChanged: (v) {
                    setState(() {
                      someValue = v;
                      print(v);
                    });
                  },
                ),
              ),
              Container(
                width: onItemSize,
                child: TitledCheckBox(
                  value: someValue,
                  title: "UI/UX",
                  onChanged: (v) {
                    setState(() {
                      someValue = v;
                      print(v);
                    });
                  },
                ),
              ),
              Container(
                width: onItemSize,
                child: TitledCheckBox(
                  value: someValue,
                  title: "Animation",
                  onChanged: (v) {
                    setState(() {
                      someValue = v;
                      print(v);
                    });
                  },
                ),
              ),
            ],
          ),
        ],
      );

  Widget skillsCheckView() => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "What skills do you have?",
            textAlign: TextAlign.start,
            style: mediumTextStyle(color: lightBlue),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.08,
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(width: 1, color: mainBorderColor),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.only(
                    right: 60,
                    left: 8,
                    top: 7,
                    bottom: 7,
                  ),
                  child: ListView.separated(
                    separatorBuilder: (c, i) => SizedBox(
                      width: 10,
                    ),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (c, i) => skillItem("Wireframing"),
                    itemCount: 5,
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    margin: EdgeInsets.only(right: 14),
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(width: 2),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.add,
                        size: 22,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Enter at last 1 skill",
            style: mediumTextStyle(color: greyShape),
            textAlign: TextAlign.right,
          ),
        ],
      );

  Widget skillItem(String title) => Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: lightBlue,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: mediumTextStyle(color: Colors.white),
            ),
            SizedBox(
              width: 4,
            ),
            Icon(
              Icons.close,
              color: Colors.white,
            ),
          ],
        ),
      );

  Widget seniorityLevelCheck({double onItemSize}) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "What type of design you do?",
            style: mediumTextStyle(color: lightBlue),
            textAlign: TextAlign.start,
          ),
          SizedBox(
            height: 16,
          ),
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            runSpacing: 17,
            children: [
              Container(
                width: onItemSize,
                child: TitledCheckBox(
                  value: someValue,
                  title: "Junior",
                  onChanged: (v) {
                    setState(() {
                      someValue = v;
                      print(v);
                    });
                  },
                ),
              ),
              Container(
                width: onItemSize,
                child: TitledCheckBox(
                  value: someValue,
                  title: "Senior",
                  onChanged: (v) {
                    setState(() {
                      someValue = v;
                      print(v);
                    });
                  },
                ),
              ),
              Container(
                width: onItemSize,
                child: TitledCheckBox(
                  value: someValue,
                  title: "Middle",
                  onChanged: (v) {
                    setState(() {
                      someValue = v;
                      print(v);
                    });
                  },
                ),
              ),
              Container(
                width: onItemSize,
                child: TitledCheckBox(
                  value: someValue,
                  title: "Not sure",
                  onChanged: (v) {
                    setState(() {
                      someValue = v;
                      print(v);
                    });
                  },
                ),
              ),
            ],
          ),
        ],
      );

  Widget workMission({double onItemSize}) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "I want to work",
            style: mediumTextStyle(color: lightBlue),
            textAlign: TextAlign.start,
          ),
          SizedBox(
            height: 16,
          ),
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            runSpacing: 17,
            children: [
              Container(
                width: onItemSize,
                child: TitledCheckBox(
                  value: someValue,
                  title: "Part time",
                  onChanged: (v) {
                    setState(() {
                      someValue = v;
                      print(v);
                    });
                  },
                ),
              ),
              Container(
                width: onItemSize,
                child: TitledCheckBox(
                  value: someValue,
                  title: "Full time",
                  onChanged: (v) {
                    setState(() {
                      someValue = v;
                      print(v);
                    });
                  },
                ),
              ),
              Container(
                width: onItemSize,
                child: TitledCheckBox(
                  value: someValue,
                  title: "Not sure",
                  onChanged: (v) {
                    setState(() {
                      someValue = v;
                      print(v);
                    });
                  },
                ),
              ),
            ],
          ),
        ],
      );
}