import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_accident/constants/app_style.dart';
import 'package:user_accident/constants/colors.dart';
import 'package:user_accident/constants/pages_name.dart';
import 'package:user_accident/core/logic/login_emergency_cubit/login_emergency_cubit.dart';

class EmergencyForm extends StatefulWidget {
  const EmergencyForm({super.key});

  @override
  State<EmergencyForm> createState() => _EmergencyFormState();
}

class _EmergencyFormState extends State<EmergencyForm> {
  bool isVisable = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginEmergencyCubit, LoginEmergencyState>(
      listener: (context, state) {
        if (state is LoginLoadingEmergencyState) {
          const Center(
            child: Center(
              child: CircularProgressIndicator(
                backgroundColor: MyColors.premiumColor,
              ),
            ),
          );
        }

        if (state is LoginSuccessEmergencyState) {
          String message = state.message;
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(message)));

          Navigator.pushReplacementNamed(context, homeEmergencyScreen);
        }

        if (state is LoginErrorEmergencyState) {
          String message = state.errorMessage;

          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(message)));
        }
      },
      builder: (context, state) {
        return Form(
          key: BlocProvider.of<LoginEmergencyCubit>(context).loginKey,
          child: Column(
            children: [
              TextFormField(
                style: AppStyle.styleRegular16(context)
                    .copyWith(color: Colors.black),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                controller: BlocProvider.of<LoginEmergencyCubit>(context)
                    .emailController,
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
                    labelText: "البريد الالكتروني",
                    labelStyle: AppStyle.styleRegular17(context),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                            width: 2, color: MyColors.premiumColor)),
                    floatingLabelStyle: AppStyle.styleRegular17(context)
                        .copyWith(
                            color: MyColors.premiumColor,
                            fontWeight: FontWeight.w600),
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
                    return " من فضلك ادخل البريد الالكتروني";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 40,
              ),
              TextFormField(
                style: AppStyle.styleRegular16(context)
                    .copyWith(color: Colors.black),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                obscureText: isVisable ? true : false,
                controller: BlocProvider.of<LoginEmergencyCubit>(context)
                    .passwordController,
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
                    labelText: "كلمة المرور",
                    labelStyle: AppStyle.styleRegular17(context),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                            width: 2, color: MyColors.premiumColor)),
                    floatingLabelStyle: AppStyle.styleRegular16(context)
                        .copyWith(
                            color: MyColors.premiumColor,
                            fontWeight: FontWeight.w600),
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
                    return "من فضلك ادخل كلمة المرور";
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
                      if (!BlocProvider.of<LoginEmergencyCubit>(context)
                          .loginKey
                          .currentState!
                          .validate()) {
                        return;
                      } else {
                        BlocProvider.of<LoginEmergencyCubit>(context).login();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: MyColors.premiumColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    child: Text(
                      "تسجيل الدخول",
                      style: AppStyle.styleSemiBold18(context),
                    ),
                  )),

                  const SizedBox(
                    height: 20,
                  ),

                    GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, contactWithAdminScreen);
                        },
                        child: Text(
                          "تواصل مع المشرف",
                          style: AppStyle.styleBold22(context)
                              .copyWith(color: MyColors.premiumColor),
                        )),
            ],
          ),
        );
      },
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(width: 1));
  }
}
