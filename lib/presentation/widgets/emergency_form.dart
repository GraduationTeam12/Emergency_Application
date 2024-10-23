import 'package:flutter/material.dart';
import 'package:user_accident/constants/app_style.dart';
import 'package:user_accident/constants/colors.dart';
 

class EmergencyForm extends StatefulWidget {
  const EmergencyForm({super.key});

  @override
  State<EmergencyForm> createState() => _EmergencyFormState();
}

class _EmergencyFormState extends State<EmergencyForm> {
  bool isVisable = true;

  final GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
            style:
                AppStyle.styleRegular16(context).copyWith(color: Colors.black),
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            controller: emailController,
            decoration: InputDecoration(
                errorStyle: AppStyle.styleRegular16(context)
                    .copyWith(color: Colors.red),
                prefixIcon: Padding(
                  padding: MediaQuery.sizeOf(context).width > 600
                      ? const EdgeInsets.symmetric(horizontal: 20)
                      : const EdgeInsets.all(0),
                  child: Icon(
                    Icons.email_outlined,
                    color: Colors.black,
                    size: MediaQuery.sizeOf(context).width > 600 ? 40 : 25,
                  ),
                ),
                labelText: "E-mail",
                labelStyle: AppStyle.styleRegular16(context),
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                        width: 2, color: MyColors.premiumColor)),
                floatingLabelStyle: AppStyle.styleRegular16(context).copyWith(
                    color: MyColors.premiumColor, fontWeight: FontWeight.w600),
                contentPadding: MediaQuery.sizeOf(context).width > 600
                    ? const EdgeInsets.all(30)
                    : const EdgeInsets.all(8),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                        width: 2, color: MyColors.premiumColor)),
                border: buildBorder()),
            validator: (email) {
              if (email!.isEmpty) {
                return "Please enter your email";
              }
              return null;
            },
          ),
          const SizedBox(
            height: 40,
          ),
          TextFormField(
            style:
                AppStyle.styleRegular16(context).copyWith(color: Colors.black),
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            obscureText: isVisable ? true : false,
            controller: passwordController,
            decoration: InputDecoration(
                errorStyle: AppStyle.styleRegular16(context)
                    .copyWith(color: Colors.red),
                prefixIcon: Padding(
                  padding: MediaQuery.sizeOf(context).width > 600
                      ? const EdgeInsets.symmetric(horizontal: 20)
                      : const EdgeInsets.all(0),
                  child: Icon(
                    Icons.lock_outlined,
                    color: Colors.black,
                    size: MediaQuery.sizeOf(context).width > 600 ? 40 : 25,
                  ),
                ),
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isVisable = !isVisable;
                      });
                    },
                    icon: isVisable
                        ? Icon(
                            Icons.visibility,
                            size: MediaQuery.sizeOf(context).width > 600
                                ? 45
                                : 25,
                          )
                        : Icon(
                            Icons.visibility_off,
                            size: MediaQuery.sizeOf(context).width > 600
                                ? 45
                                : 25,
                          )),
                labelText: "Password",
                labelStyle: AppStyle.styleRegular16(context),
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                        width: 2, color: MyColors.premiumColor)),
                floatingLabelStyle: AppStyle.styleRegular16(context).copyWith(
                    color: MyColors.premiumColor, fontWeight: FontWeight.w600),
                contentPadding: MediaQuery.sizeOf(context).width > 600
                    ? const EdgeInsets.all(30)
                    : const EdgeInsets.all(8),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                        width: 2, color: MyColors.premiumColor)),
                border: buildBorder()),
            validator: (password) {
              if (password!.isEmpty) {
                return "Please enter your password";
              }
              return null;
            },
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
              width: double.infinity,
              height: MediaQuery.sizeOf(context).width > 600 ? 70 : 47,
              child: ElevatedButton(
                onPressed: () async {
                  if (!formKey.currentState!.validate()) {
                    return;
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: MyColors.premiumColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                child: Text(
                  "Log In",
                  style: AppStyle.styleSemiBold18(context),
                ),
              )),
        ],
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(width: 1));
  }
}
