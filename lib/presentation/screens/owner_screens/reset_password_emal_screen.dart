
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:user_accident/constants/app_images.dart';
import 'package:user_accident/constants/app_style.dart';
import 'package:user_accident/presentation/widgets/custom_app_bar.dart';
import 'package:user_accident/presentation/widgets/reset_password_pin_code.dart';
import 'package:user_accident/presentation/widgets/reset_password_text.dart';

class ResetPasswordEmailScreen extends StatelessWidget {
  const ResetPasswordEmailScreen({super.key,
   required this.email
   });

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
          appBar: buildCustomAppBar(context, 'Reset Password'),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(Assets.imagesAuthImagesVerify),
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
