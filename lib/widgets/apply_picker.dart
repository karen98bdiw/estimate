import 'package:flutter/material.dart';
import '../utils/country.dart';

Future<void> applyPicker({BuildContext context}) async {
  var res = await showDialog(
    context: context,
    builder: (c) => ApplyPickerDiolog(),
  );
  return res;
}

class Apply extends StatelessWidget {
  final CountryAndFlags item;

  Apply({this.item});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(item.flag),
      title: Text(item.name),
      subtitle: Text(item.dialCode),
    );
  }
}

class ApplyPickerDiolog extends StatefulWidget {
  @override
  _ApplyPickerDiologState createState() => _ApplyPickerDiologState();
}

class _ApplyPickerDiologState extends State<ApplyPickerDiolog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      insetPadding: EdgeInsets.zero,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.6,
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
