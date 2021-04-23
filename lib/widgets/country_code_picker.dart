import 'package:flutter/material.dart';
import '../utils/country.dart';

Future<CountryAndFlags> countyPickerDialog({BuildContext context}) async {
  var res = await showModalBottomSheet(
    context: context,
    builder: (c) => Container(
      height: MediaQuery.of(context).size.height * 0.6,
      width: MediaQuery.of(context).size.width * 0.7,
      child: ListView.builder(
        itemBuilder: (c, i) => GestureDetector(
          child: CountryItem(
            item: CountryAndFlags.countries[i],
          ),
          onTap: () {
            Navigator.of(context).pop(CountryAndFlags.countries[i]);
          },
        ),
        itemCount: CountryAndFlags.countries.length,
      ),
    ),
  );
  return res;
}

class CountryItem extends StatelessWidget {
  final CountryAndFlags item;

  CountryItem({this.item});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(item.flag),
      title: Text(item.name),
      subtitle: Text(item.dialCode),
    );
  }
}
