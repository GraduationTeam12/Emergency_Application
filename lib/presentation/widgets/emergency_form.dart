import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_accident/constants/app_style.dart';
import 'package:user_accident/constants/colors.dart';
import 'package:user_accident/core/logic/login_cubit/login_cubit.dart';

class EmergencyForm extends StatefulWidget {
  const EmergencyForm({super.key});

  @override
  State<EmergencyForm> createState() => _EmergencyFormState();
}

class _EmergencyFormState extends State<EmergencyForm> {
  bool isVisable = true;

  TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            controller: emailController,
            decoration: InputDecoration(
                prefixIcon:
                    const Icon(Icons.email_outlined, color: Colors.black),
                labelText: "E-mail",
                labelStyle: AppStyle.styleRegular16(context),
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                        width: 2, color: MyColors.premiumColor)),
                floatingLabelStyle: AppStyle.styleRegular16(context).copyWith(
                    color: MyColors.premiumColor, fontWeight: FontWeight.w600),
                contentPadding: const EdgeInsets.all(8),
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
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            obscureText: isVisable ? true : false,
            controller:  passwordController,
            decoration: InputDecoration(
                prefixIcon:
                    const Icon(Icons.lock_outlined, color: Colors.black),
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isVisable = !isVisable;
                      });
                    },
                    icon: isVisable
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off)),
                labelText: "Password",
                labelStyle: AppStyle.styleRegular16(context),
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                        width: 2, color: MyColors.premiumColor)),
                floatingLabelStyle: AppStyle.styleRegular16(context).copyWith(
                    color: MyColors.premiumColor, fontWeight: FontWeight.w600),
                contentPadding: const EdgeInsets.all(8),
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
              height: 47,
              child: ElevatedButton(
                onPressed: () async {
                  if (!BlocProvider.of<LoginCubit>(context)
                      .loginKey
                      .currentState!
                      .validate()) {
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
