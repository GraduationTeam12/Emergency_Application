import 'package:flutter/material.dart';
import 'package:user_accident/constants/app_style.dart';

abstract class DecorationTextField {
  static TextFormField decorationTextfield(BuildContext context) {
    return TextFormField(
        decoration: InputDecoration(
            prefixIcon: const Icon(
              Icons.email_outlined,
              color: Color(0xFF9C8A8A),
            ),
            hintText: "E-mail",
            hintStyle: AppStyle.styleRegular16(context),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(width: 1))));
  }
}
