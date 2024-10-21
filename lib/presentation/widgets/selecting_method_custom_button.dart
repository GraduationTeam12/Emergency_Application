import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:user_accident/constants/app_style.dart';
import 'package:user_accident/constants/pages_name.dart';

class SelectingMethodCustomButton extends StatelessWidget {
  const SelectingMethodCustomButton({
    super.key,
    required this.title,
    this.icon,
    this.color,
    required this.textColor,
  });

  final String title;
  final String? icon;
  final Color? color;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //height: 47.sp* MediaQuery.sizeOf(context).height*0.0017,
      child: ElevatedButton(
          onPressed: () {
          color!= null?  Navigator.pushReplacementNamed(context, onBoardingScreen) : Navigator.pushReplacementNamed(context, emergencyOnBoardScreen);
          },
          style: ElevatedButton.styleFrom(
            elevation: 6,
            // color != null ? 6 : 0,
            shape: RoundedRectangleBorder(
                side: BorderSide(width: color != null ? 0 : 1),
                borderRadius: BorderRadius.circular(15)),
            backgroundColor: color ?? Colors.white,
          ),
          child: Padding(
            padding:  EdgeInsets.all(12.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(icon ?? '',height: 20* MediaQuery.sizeOf(context).height*0.00122,width:30* MediaQuery.sizeOf(context).height*0.00112,),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  title,
                  style: AppStyle.styleSemiBold25(context)
                      .copyWith(color: textColor),
                ),
              ],
            ),
          )),
    );
  }
}