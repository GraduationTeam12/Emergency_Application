// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:user_accident/constants/app_images.dart';
import 'package:user_accident/constants/app_style.dart';
import 'package:user_accident/constants/pages_name.dart';
import 'package:user_accident/presentation/widgets/reset_password_pin_code.dart';
import 'package:user_accident/presentation/widgets/reset_password_text.dart';

class ResetPasswordEmailScreen extends StatelessWidget {
  const ResetPasswordEmailScreen({super.key, required this.email});

  final email;
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
                  Navigator.pushReplacementNamed(
                      context, forgotPasswordEmailScreen);
                },
                icon: Padding(
                  padding: MediaQuery.sizeOf(context).width > 600
                      ? const EdgeInsets.symmetric(horizontal: 20)
                      : const EdgeInsets.all(0),
                  child: Icon(
                    Icons.arrow_back,
                    size: MediaQuery.sizeOf(context).width > 600 ? 40 : 25,
                  ),
                )),
            title: Center(
                child: Text(
              'Reset Password',
              style: AppStyle.styleRegular30(context),
            )),
          ),

          // buildCustomAppBar(context, 'Reset Password'),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width > 600
                            ? MediaQuery.sizeOf(context).width / 2
                            : null,
                        height: MediaQuery.sizeOf(context).width > 600
                            ? MediaQuery.of(context).size.height / 3
                            : null,
                        child: SvgPicture.asset(
                          Assets.imagesAuthImagesVerify,
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      ResetPasswordText(
                        email: email,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      const PinCode(),
                      const SizedBox(
                        height: 30,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "Resend Code",
                            style: AppStyle.styleRegular17(context)
                                .copyWith(color: const Color(0xFF3D6498)),
                          ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
