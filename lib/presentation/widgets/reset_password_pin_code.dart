import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';
import 'package:user_accident/constants/app_style.dart';
import 'package:user_accident/constants/colors.dart';
import 'package:user_accident/constants/pages_name.dart';
import 'package:user_accident/core/logic/forgot_password_cubit/cubit/forgot_password_cubit.dart';
import 'package:user_accident/core/logic/forgot_password_cubit/cubit/forgot_password_state.dart';
import 'package:user_accident/presentation/widgets/custom_elevated_button.dart';

class PinCode extends StatelessWidget {
  const PinCode({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
      listener: (context, state) {
        if (state is VerifyCodeLoading) {
          const CircularProgressIndicator(
            backgroundColor: Colors.amber,
          );
        }

        if (state is VerifyCodeSuccess) {
          Navigator.pushReplacementNamed(context, changePasswordScreen);
        }

        if (state is VerifyCodeError) {
          String message = state.errMessage;
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(message)));
        }
      },
      builder: (context, state) {
        return Form(
          key: BlocProvider.of<ForgotPasswordCubit>(context).verifyCodeKey,
          child: Column(
            children: [
              Pinput(
                submittedPinTheme: PinTheme(
                  margin: MediaQuery.sizeOf(context).width > 600
                      ? const EdgeInsets.symmetric(horizontal: 20)
                      : const EdgeInsets.symmetric(horizontal: 7),
                  height: MediaQuery.sizeOf(context).width > 600 ? 100 : 60,
                  width: MediaQuery.sizeOf(context).width > 600 ? 90 : 50,
                  textStyle: AppStyle.styleRegular16(context)
                      .copyWith(color: Colors.black),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 225, 239, 247),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: makeShadowBox,
                    border: Border.all(color: MyColors.premiumColor, width: 2),
                  ),
                ),
                errorTextStyle: AppStyle.styleRegular16(context)
                    .copyWith(color: Colors.red),
                length: 4,
                controller: BlocProvider.of<ForgotPasswordCubit>(context)
                    .codeController,
                focusNode: FocusNode(),
                defaultPinTheme: PinTheme(
                  margin: MediaQuery.sizeOf(context).width > 600
                      ? const EdgeInsets.symmetric(horizontal: 20)
                      : const EdgeInsets.symmetric(horizontal: 7),
                  height: MediaQuery.sizeOf(context).width > 600 ? 100 : 60,
                  width: MediaQuery.sizeOf(context).width > 600 ? 90 : 50,
                  textStyle: AppStyle.styleRegular16(context)
                      .copyWith(color: Colors.black),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: makeShadowBox,
                    border: Border.all(color: MyColors.premiumColor, width: 2),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter 4 digit code to reset your password";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 25,
              ),
              CustomElevatedButton(
                  title: 'Verify Code',
                  onPressed: () {
                    if (!BlocProvider.of<ForgotPasswordCubit>(context)
                        .verifyCodeKey
                        .currentState!
                        .validate()) {
                      return;
                    } else {
                      BlocProvider.of<ForgotPasswordCubit>(context)
                          .verifyCode();
                    }
                  }),
            ],
          ),
        );
      },
    );
  }

  List<BoxShadow> get makeShadowBox {
    return const [
      BoxShadow(
        color: Color(0x3F000000),
        spreadRadius: 0,
        offset: Offset(0, 4),
        blurRadius: 4,
      )
    ];
  }
}
