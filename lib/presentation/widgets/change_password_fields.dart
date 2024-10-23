
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_accident/constants/app_style.dart';
import 'package:user_accident/constants/colors.dart';
import 'package:user_accident/constants/pages_name.dart';
import 'package:user_accident/core/logic/forgot_password_cubit/cubit/forgot_password_cubit.dart';
import 'package:user_accident/core/logic/forgot_password_cubit/cubit/forgot_password_state.dart';
import 'package:user_accident/presentation/widgets/custom_elevated_button.dart';

class ChangePasswordFields extends StatefulWidget {
  const ChangePasswordFields({super.key});

  @override
  State<ChangePasswordFields> createState() => _ChangePasswordFieldsState();
}

class _ChangePasswordFieldsState extends State<ChangePasswordFields> {
  bool isVisible1 = true;
  bool isVisible2 = true;
  // final TextEditingController passwordController = TextEditingController();
  // final TextEditingController newPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
      listener: (context, state) {
        if (state is ResetPasswordLoading) {
          const CircularProgressIndicator(
            backgroundColor: Colors.amber,
          );
        }

        if (state is ResetPasswordSuccess) {
          String message = state.message;

          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(message)));
          Navigator.pushReplacementNamed(context, signInScreen);
        }

        if (state is ResetPasswordError) {
          String message = state.errMessage;

          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(message) , duration: const Duration(days: 1),));
           
        }
      },
      builder: (context, state) {
        return Form(
          key: BlocProvider.of<ForgotPasswordCubit>(context).resetPasswordKey,
          child: Column(
            children: [
              TextFormField(
                style: AppStyle.styleRegular16(context).copyWith(color: Colors.black),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                obscureText: isVisible1 ? true : false,
                controller: BlocProvider.of<ForgotPasswordCubit>(context)
                    .passwordController,
                decoration: InputDecoration(
                    errorStyle: AppStyle.styleRegular16(context).copyWith(color: Colors.red),
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
                            isVisible1 = !isVisible1;
                          });
                        },
                        icon: isVisible1
                            ?  Icon(Icons.visibility , size: MediaQuery.sizeOf(context).width > 600 ? 45 : 25, )
                            :  Icon(Icons.visibility_off , size: MediaQuery.sizeOf(context).width > 600 ? 45 : 25,)),
                    labelText: "New Password",
                    labelStyle: AppStyle.styleRegular16(context),
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
                    return "Please enter your new password";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                style: AppStyle.styleRegular16(context).copyWith(color: Colors.black),
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                obscureText: isVisible2 ? true : false,
                controller: BlocProvider.of<ForgotPasswordCubit>(context)
                    .confirmPasswordController,
                decoration: InputDecoration(
                  errorStyle: AppStyle.styleRegular16(context).copyWith(color: Colors.red),
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
                            isVisible2 = !isVisible2;
                          });
                        },
                        icon: isVisible2
                            ?  Icon(Icons.visibility , size: MediaQuery.sizeOf(context).width > 600 ? 45 : 25, )
                            :  Icon(Icons.visibility_off , size: MediaQuery.sizeOf(context).width > 600 ? 45 : 25,)),
                    labelText: "Confirm Password",
                    labelStyle: AppStyle.styleRegular16(context),
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
                    return "Please enter your password to confirm it";
                  }

                  if (password !=
                      BlocProvider.of<ForgotPasswordCubit>(context)
                          .passwordController
                          .text) {
                    return 'New and confirm password must be equal';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              CustomElevatedButton(
                  title: 'Confirm',
                  onPressed: () {
                    if (!BlocProvider.of<ForgotPasswordCubit>(context)
                        .resetPasswordKey
                        .currentState!
                        .validate()) {
                      return;
                    } else {
                      BlocProvider.of<ForgotPasswordCubit>(context)
                          .resetPassword();
                    }
                  })
            ],
          ),
        );
      },
    );
  }
}

OutlineInputBorder buildBorder() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(width: 1));
}
