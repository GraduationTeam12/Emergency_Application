import 'package:flutter/material.dart';
import 'package:user_accident/constants/app_style.dart';
import 'package:user_accident/presentation/widgets/custom_elevated_button.dart';

class ForgotPasswordField extends StatefulWidget {
  const ForgotPasswordField({
    super.key,
  });

  @override
  State<ForgotPasswordField> createState() => _ForgotPasswordFieldState();
}

class _ForgotPasswordFieldState extends State<ForgotPasswordField> {
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.done,
          controller: emailController,
          decoration: InputDecoration(
              prefixIcon: const Icon(Icons.email_outlined, color: Colors.black),
              hintText: "E-mail",
              hintStyle: AppStyle.styleRegular16(context),
              contentPadding: const EdgeInsets.all(1),
              focusedBorder: buildBorder(),
              border: buildBorder()),
          validator: (email) {
            if (email!.isEmpty) {
              return "Please enter your email";
            }
            return null;
          },
        ),
        const SizedBox(
          height: 30,
        ),
        CustomElevatedButton(title: "Send Code", onPressed: () {})
      ],
    );
  }
}

OutlineInputBorder buildBorder() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(width: 1));
}
