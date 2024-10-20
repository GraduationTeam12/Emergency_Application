import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:user_accident/constants/colors.dart';
import 'package:user_accident/constants/pages_name.dart';
import 'package:user_accident/core/logic/forgot_password_cubit/cubit/forgot_password_cubit.dart';
import 'package:user_accident/core/logic/forgot_password_cubit/cubit/forgot_password_state.dart';
import 'package:user_accident/presentation/widgets/custom_elevated_button.dart';

class PinCode extends StatelessWidget {
  const PinCode({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgotPasswordCubit,  ForgotPasswordState>(
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
              PinCodeTextField(
                appContext: context,
                cursorColor: Colors.black,
                controller: BlocProvider.of<ForgotPasswordCubit>(context)
                    .codeController,
                length: 4,
                keyboardType: TextInputType.number,
                obscureText: false,
                animationType: AnimationType.scale,
                pinTheme: PinTheme(
                  inActiveBoxShadow: makeShadowBox,
                  activeBoxShadow: makeShadowBox,
                  errorBorderColor: MyColors.premiumColor,
                  fieldOuterPadding: const EdgeInsets.symmetric(horizontal: 10),
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(10),
                  fieldHeight: 70,
                  fieldWidth: 60,
                  borderWidth: 0.1,
                  activeColor: MyColors.premiumColor,
                  inactiveColor: MyColors.premiumColor,
                  inactiveFillColor: Colors.white,
                  activeFillColor: const Color.fromARGB(255, 225, 239, 247),
                  selectedColor: MyColors.premiumColor,
                  selectedFillColor: Colors.white,
                ),
                animationDuration: const Duration(milliseconds: 300),
                backgroundColor: Colors.white,
                enableActiveFill: true,

                validator: (value) {
                    if (value!.isEmpty) {
              return "Please enter 4 digit code to reset your password";
            }
            return null;
                },
              ),

              const SizedBox(
                height: 6,
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
