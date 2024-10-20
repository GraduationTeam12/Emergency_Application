import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:user_accident/constants/app_images.dart';
import 'package:user_accident/constants/app_style.dart';
import 'package:user_accident/presentation/models/on_board_model_pageview.dart';

class OnBoardingBody extends StatelessWidget {
  const OnBoardingBody({
    super.key,
    required this.index,
  });

  final int index;
  static List<OnBoardModelPageview> items = [
    OnBoardModelPageview(
        img: Assets.imagesAuthImagesOnBoarding1,
        title: "Team",
        description1: "We are a cohesive team striving to achieve and",
        discription2: "ensure safety for everyone."),
    OnBoardModelPageview(
        img: Assets.imagesAuthImagesOnBoarding2,
        title: "Goal",
        description1: "The goal is to facilitate the prompt arrival of",
        discription2: "rescue teams at the nearest hospital or",
        discription3: "emergency center."),
    OnBoardModelPageview(
        img: Assets.imagesAuthImagesOnBoarding3,
        title: "Vision",
        description1: "Improvement Project using sensors is to",
        discription2: "revolutionize how road accidents are managed",
        discription3: "by integrating advanced technology"),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: SizedBox(
            child: SvgPicture.asset(items[index].img),
          ),
        ),
        const SizedBox(height: 15),
        Center(
          child: Text(
            items[index].title,
            style: AppStyle.styleBold25(context),
          ),
        ),
        const SizedBox(height: 15),
          Column(
            children: [
              FittedBox(
                child: Text(
                  items[index].description1,
                  style: AppStyle.styleRegular17(context).copyWith(fontWeight: FontWeight.w600)
                ),
              ),
              FittedBox(
                child: Text(
                  items[index].discription2,
                  style: AppStyle.styleRegular17(context).copyWith(fontWeight: FontWeight.w600)
                ),
              ),
              Text(
                items[index].discription3 ?? '',
                style: AppStyle.styleRegular17(context).copyWith(fontWeight: FontWeight.w600)
              )
            ],
          ),
        
      ],
    );
  }
}
