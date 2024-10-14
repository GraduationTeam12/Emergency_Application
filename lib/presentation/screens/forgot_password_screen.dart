import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:user_accident/constants/app_images.dart';
import 'package:user_accident/constants/app_style.dart';
import 'package:user_accident/presentation/widgets/custom_app_bar.dart';
import 'package:user_accident/presentation/widgets/forgot_password_field.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: buildCustomAppBar(context, "Forgot Password"),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Expanded(
                  child: SizedBox(
                height: 20,
              )),
              SizedBox(
                child: SvgPicture.asset(Assets.imagesAuthImagesForgotPassword),
              ),
              const SizedBox(
                height: 50,
              ),
              Column(
                children: [
                  FittedBox(
                      child: Text(
                    "Enter your registered E-mail We will send you a",
                    style: AppStyle.styleRegular17(context),
                  )),
                  FittedBox(
                      child: Text(
                    " code with instructions to reset your password ",
                    style: AppStyle.styleRegular17(context),
                  )),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const ForgotPasswordField(),

                const Expanded(
                child: SizedBox(
              height: 20,
            ))
            ],
          ),
        ),
      ),
    );
  }
}
