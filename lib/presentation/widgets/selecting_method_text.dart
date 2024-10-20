import 'package:flutter/material.dart';
import 'package:user_accident/constants/app_style.dart';
import 'package:user_accident/constants/colors.dart';

class SelectingMethodText extends StatelessWidget {
  const SelectingMethodText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        
        FittedBox(
          child: RichText(
              text: TextSpan(
                  text: "Welcome to ",
                  style: AppStyle.styleRegular25(context),
                  children: <TextSpan>[
                TextSpan(
                    text: "SATARS",
                    style: AppStyle.styleRegular25(context).copyWith(fontWeight: FontWeight.w600)
                        .copyWith(color: MyColors.premiumColor)),
              ])),
        ),

        FittedBox(
            child: Text(
          "Family!",
          style: AppStyle.styleRegular25(context),
        )),
      ],
    );
    // return Column(
    //   children:  [
    //     Text("Welcome to SATARS", style: AppStyle.styleBold20(context) ,),
    //     Text("Family!", style: AppStyle.styleBold20(context)),
    //     // Text("choose wisely please", style: AppStyle.styleBold20(context)),

    //   ],
    // );
  }
}
