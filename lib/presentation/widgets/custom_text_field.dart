import 'package:flutter/material.dart';
import 'package:user_accident/constants/app_style.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({super.key, required this.hintText, required this.icon});

  final String hintText;
  final Icon icon;
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: formKey,
      decoration: InputDecoration(
        prefixIcon: icon,
          hintText: hintText, hintStyle: AppStyle.styleRegular16(context),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(width: 1)
          )
          ),
    );
  }
}
