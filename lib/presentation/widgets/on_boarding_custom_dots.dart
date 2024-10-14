import 'package:flutter/material.dart';
import 'package:user_accident/constants/colors.dart';

class OnBoardingCustomDots extends StatelessWidget {
  const OnBoardingCustomDots({super.key, required this.isActive});

  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(microseconds: 300),
      width: isActive ? 32 : 10,
      height: 10,
      decoration: BoxDecoration(
          color: isActive ? MyColors.premiumColor : Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [
            BoxShadow(
              color: Color(0x3F000000),
              spreadRadius: 0,
              offset: Offset(0, 4),
              blurRadius: 4,
            )
          ]),
    );
  }
}
