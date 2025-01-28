import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:user_accident/presentation/widgets/on_boarding_body_emergency.dart';

class OnBoardingPageview extends StatelessWidget {
  const OnBoardingPageview({super.key, required this.pageController });

   
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return ExpandablePageView(
        controller: pageController,
        scrollDirection: Axis.horizontal,
        children: List.generate(
            3,
            (index) => OnBoardingBodyEmergency(index: index)));
  }
}
