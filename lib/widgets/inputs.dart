import 'package:estimators_app/utils/constats.dart';
import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final FormFieldValidator<String> validator;
  final FormFieldSetter<String> onSaved;
  final String hint;
  final obscure;

  CustomInput({this.hint, this.onSaved, this.validator, this.obscure = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscure,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.all(15),
        fillColor: Color.fromRGBO(228, 225, 225, 1),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: blueShape,
            )),
        hintText: hint,
        hintStyle: TextStyle(
          height: 1,
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: trasnparentBlueShape,
        ),
      ),
    );
  }
}

class CustomFormInput extends StatelessWidget {
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  final String hint;
  final Widget prefix;
  final Widget sufix;
  final bool obscureText;

  CustomFormInput({
    this.onSaved,
    this.validator,
    this.hint,
    this.prefix,
    this.obscureText = false,
    this.sufix,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16),
      child: TextFormField(
        obscureText: obscureText,
        validator: validator,
        onSaved: onSaved,
        decoration: InputDecoration(
            prefixIcon: prefix != null
                ? Padding(
                    padding: EdgeInsetsDirectional.only(
                      top: 14,
                      start: 14,
                      end: 14,
                      bottom: 14,
                    ),
                    child: prefix,
                  )
                : null,
            suffixIcon: prefix != null
                ? Padding(
                    padding: EdgeInsetsDirectional.only(
                      top: 14,
                      start: 14,
                      end: 14,
                      bottom: 14,
                    ),
                    child: sufix,
                  )
                : null,
            isDense: true,
            contentPadding: EdgeInsetsDirectional.only(
              top: 12,
              bottom: 12,
              start: 14,
              end: 14,
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: mainBorderColor,
                  width: 1,
                )),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: mainBorderColor,
                  width: 1,
                )),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: mainBorderColor,
                  width: 1,
                )),
            hintText: hint,
            hintStyle: TextStyle(
              color: Color.fromRGBO(137, 137, 137, 1),
              fontSize: 18,
              fontWeight: FontWeight.w400,
              height: 1,
            )),
      ),
    );
  }
}
