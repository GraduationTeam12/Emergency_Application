import 'package:flutter/material.dart';
import 'package:user_accident/presentation/widgets/on_boarding_custom_dots.dart';

class DotsIndicator extends StatelessWidget {
  const DotsIndicator({super.key, required this.currentIndex});

  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
          3,
          (index) => Padding(
                padding: MediaQuery.sizeOf(context).width < 600 ? const EdgeInsets.only(right:  12) : const EdgeInsets.only(right:  25),
                child: OnBoardingCustomDots(isActive: index == currentIndex),
              )),
    );
  }
}
