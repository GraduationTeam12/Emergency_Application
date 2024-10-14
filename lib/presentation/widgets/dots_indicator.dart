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
                padding: const EdgeInsets.only(right: 12),
                child: OnBoardingCustomDots(isActive: index == currentIndex),
              )),
    );
  }
}
