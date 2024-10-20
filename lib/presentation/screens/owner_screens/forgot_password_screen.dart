
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:user_accident/constants/app_images.dart';
import 'package:user_accident/constants/app_style.dart';
import 'package:user_accident/constants/pages_name.dart';
import 'package:user_accident/presentation/widgets/forgot_password_email_field.dart';


class ForgotPasswordEmailScreen extends StatelessWidget {
  const ForgotPasswordEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            scrolledUnderElevation: 0,
            backgroundColor: Colors.white,
            toolbarHeight: MediaQuery.sizeOf(context).height / 8,
            leading: IconButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, signInScreen);
                },
                icon: const Icon(Icons.arrow_back)),
            title: Center(
                child: Text(
              'Forgot Password',
              style: AppStyle.styleRegular25(context),
            )),
          ),

          //  buildCustomAppBar(context, "Forgot Password"),
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
                        child: SvgPicture.asset(
                            Assets.imagesAuthImagesForgotPassword),
                      ),
                      const SizedBox(height: 50),
                      Column(
                        children: [
                          FittedBox(
                            child: Text(
                              "Please enter your email address to",
                              style: AppStyle.styleRegular17(context).copyWith(fontWeight: FontWeight.w600)
                            ),
                          ),
                          FittedBox(
                            child: Text(
                              "receive a verification code",
                              style: AppStyle.styleRegular17(context).copyWith(fontWeight: FontWeight.w600)
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      const ForgotPasswordEmailField(),
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
