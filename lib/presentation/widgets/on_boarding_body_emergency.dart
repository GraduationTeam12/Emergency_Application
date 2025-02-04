import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:user_accident/constants/app_images.dart';
import 'package:user_accident/constants/app_style.dart';
import 'package:user_accident/presentation/models/on_board_model_pageview.dart';

class OnBoardingBodyEmergency extends StatelessWidget {
  const OnBoardingBodyEmergency({super.key, required this.index});

  final int index;
  static List<OnBoardModelPageview> items = [
    OnBoardModelPageview(
        img: Assets.imagesAuthImagesOnBoarding1Emergency,
        title: "الطوارئ",
        description1: "نحن نسعى جاهدين لضمان السلامة والاستجابة السريعة",
        discription2: "حالات الطوارئ ونأمل أن نقدم لكم أكبر فائدة.",
        // discription3: "the greatest benefit."
        ),
    OnBoardModelPageview(
        img: Assets.imagesAuthImagesOnBoarding2Emergency,
        title: " تحديد الموقع",
        description1: "الحصول على موقع الحادث في اسرع وقت في حالة حدوث",
        discription2: "الحادث وتقديم المساعدة المناسبة لك في وقت قصير.",
        // discription3: "assistance to you in a short time."
        ),
    OnBoardModelPageview(
      img: Assets.imagesAuthImagesOnBoarding3Emergency,
      title: "التقارير اليومية",
      description1: " إعداد التقارير اليومية عن عددالحوادث",
      discription2: "والأماكن الأكثر شيوعا.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width > 600
                ? MediaQuery.sizeOf(context).width / 2
                : null,
            height: MediaQuery.sizeOf(context).width > 600
                ? MediaQuery.of(context).size.height / 3
                : null,
            child: SvgPicture.asset(
              items[index].img,
              fit: BoxFit.contain,
            ),
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
              Text(items[index].description1,
                  style: AppStyle.styleRegular20(context)
                      .copyWith(fontWeight: FontWeight.w600)),
              Text(items[index].discription2,
                  style: AppStyle.styleRegular20(context)
                      .copyWith(fontWeight: FontWeight.w600)),
              Text(items[index].discription3 ?? '',
                  style: AppStyle.styleRegular20(context)
                      .copyWith(fontWeight: FontWeight.w600))
            ],
          ),
        ),
      ],
    );
  }
}
