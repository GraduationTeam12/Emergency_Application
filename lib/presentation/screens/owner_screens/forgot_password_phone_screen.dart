import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:user_accident/constants/app_images.dart';
import 'package:user_accident/constants/app_style.dart';
import 'package:user_accident/presentation/widgets/custom_app_bar.dart';
import 'package:user_accident/presentation/widgets/forgot_password_phone_field.dart';

class ForgotPasswordPhoneScreen extends StatelessWidget {
  const ForgotPasswordPhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: buildCustomAppBar(context, 'Forgot Password'),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 50),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2,
                        height: MediaQuery.of(context).size.height / 4,
                        child: SvgPicture.asset(
                            Assets.imagesAuthImagesForgotPassword,
                            fit: BoxFit.contain,
                            ),
                      ),
                      const SizedBox(height: 50),
                      Column(
                        children: [
                          FittedBox(
                            child: Text(
                              "Please enter your phone number to",
                              style: AppStyle.styleRegular17(context)
                                  .copyWith(fontWeight: FontWeight.w600),
                            ),
                          ),
                          FittedBox(
                              child: Text("receive a verification code",
                                  style: AppStyle.styleRegular17(context)
                                      .copyWith(fontWeight: FontWeight.w600))),
                        ],
                      ),
                      const SizedBox(height: 30),
                      const ForgotPasswordByPhoneField(),
                    ],
                  ),
                ),
                const SliverFillRemaining(
                  hasScrollBody: false,
                  child: SizedBox(height: 20),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
