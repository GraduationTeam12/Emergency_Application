import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:user_accident/constants/app_images.dart';
import 'package:user_accident/constants/app_style.dart';
import 'package:user_accident/presentation/models/on_board_model_pageview.dart';

class OnBoardingBodyEmergency extends StatelessWidget {
  const OnBoardingBodyEmergency({super.key, required this.index});

  final int index;
  static List<OnBoardModelPageview> items =[
    OnBoardModelPageview(
        img: Assets.imagesAuthImagesOnBoarding1Emergency,
        title: "Emergency",
        description1: "We strive to ensure safety and prompt response",
        discription2: "to emergencies and we hope to provide you with",
        discription3: "the greatest benefit."),
    OnBoardModelPageview(
        img: Assets.imagesAuthImagesOnBoarding2Emergency,
        title: " Location identification",
        description1: "Quickly obtaining your location in the event of an",
        discription2: "incident and delivering the appropriate",
        discription3: "assistance to you in a short time."),
    OnBoardModelPageview(
        img: Assets.imagesAuthImagesOnBoarding3Emergency,
        title: "Report",
        description1: "Preparation of daily reports on the number of",
        discription2: "incidents and the most common locations.",
        ),
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
        FittedBox(
          child: Column(
            children: [
              Text(
                items[index].description1,
                style: AppStyle.styleRegular17(context).copyWith(fontWeight: FontWeight.w600)
              ),
              Text(
                items[index].discription2,
                style: AppStyle.styleRegular17(context).copyWith(fontWeight: FontWeight.w600)
              ),
              Text(
                items[index].discription3 ?? '',
                style: AppStyle.styleRegular17(context).copyWith(fontWeight: FontWeight.w600)
              )
            ],
          ),
        ),
      ],
    );
  }
}
