import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:user_accident/constants/app_style.dart';
import 'package:user_accident/constants/pages_name.dart';
import 'package:user_accident/presentation/screens/on_boarding.dart';

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
      height: 47,
      child: ElevatedButton(
          onPressed: () {
          Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => OnBoardingScreen(isOwner:  color!= null),) )  ;
          },
          style: ElevatedButton.styleFrom(
            elevation: color != null ? 6 : 0,
            shape: RoundedRectangleBorder(
                side: BorderSide(width: color != null ? 0 : 1),
                borderRadius: BorderRadius.circular(15)),
            backgroundColor: color ?? Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(icon ?? ''),
              const SizedBox(
                width: 10,
              ),
              Text(
                title,
                style: AppStyle.styleSemiBold25(context)
                    .copyWith(color: textColor),
              ),
            ],
          )),
    );
  }
}
