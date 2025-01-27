
// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:user_accident/constants/app_style.dart';
import 'package:user_accident/constants/colors.dart';

class ResetPasswordText extends StatelessWidget {
  const ResetPasswordText({
    super.key,
    required this.email,
  });

  final email;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FittedBox(
            child: Text("Please enter the 4 digit code",
                style: AppStyle.styleRegular17(context)
                    .copyWith(fontWeight: FontWeight.w600))),
        FittedBox(
          child: RichText(
              text: TextSpan(
                  text: " sent to: ",
                  style: AppStyle.styleRegular17(context)
                      .copyWith(fontWeight: FontWeight.w600),
                  children: <TextSpan>[
                TextSpan(
                    text:
                    //  'you@example.com',
                     '$email',
                    style: AppStyle.styleRegular17(context).copyWith(
                        fontWeight: FontWeight.w600,
                        color: MyColors.premiumColor)),
              ])),
        ),
      ],
    );
  }
}
