// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:user_accident/constants/app_style.dart';
import 'package:user_accident/constants/colors.dart';
import 'package:user_accident/presentation/screens/emegency_screens/places_screen.dart';

class ReportAccidentPlacesAndNumberOfAccident extends StatelessWidget {
  const ReportAccidentPlacesAndNumberOfAccident({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.sizeOf(context).width > 600 ? 200 : 120,
          padding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: MediaQuery.sizeOf(context).width > 600 ? 25 : 10),
          decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: const BorderSide(
                  color: MyColors.premiumColor,
                  width: 1.5,
                ),
              ),
              color: Colors.white,
              shadows: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: const Offset(0, 2),
                ),
              ]),
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                              width: MediaQuery.sizeOf(context).width > 600
                                  ? 50
                                  : null,
                              height: MediaQuery.sizeOf(context).width > 600
                                  ? 50
                                  : null,
                              'assets/images/auth_images/emergency_images/bluecar.svg'),
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width > 600
                                ? 25
                                : 10,
                          ),
                          Text('Most Accident places',
                              style: AppStyle.styleSemiBold28(context).copyWith(
                                  color: MyColors.premiumColor,
                                  fontFamily: 'Inter')),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.sizeOf(context).width > 600
                                ? 81
                                : 35),
                        child: Text('3 Places for Today',
                            style: AppStyle.styleRegular20(context).copyWith(
                              fontFamily: 'Roboto',
                            )),
                      ),
                    ],
                  ),
                ],
              ),
              Positioned(
                top: MediaQuery.sizeOf(context).width > 600 ? 80 : 45,
                right: 10,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>const PlacesScreen(),));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: MyColors.premiumColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'Show',
                    style: AppStyle.styleRegular17(context)
                        .copyWith(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          height: MediaQuery.sizeOf(context).width > 600
              ? 250
              : MediaQuery.sizeOf(context).width > 450 &&
                      MediaQuery.sizeOf(context).width < 600
                  ? 150
                  : 120,
          padding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: MediaQuery.sizeOf(context).width > 600 ? 25 : 10),
          decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              color: Colors.amber,
              shadows: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: const Offset(0, 4),
                ),
              ]),
          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                              width: MediaQuery.sizeOf(context).width > 600
                                  ? 50
                                  : null,
                              height: MediaQuery.sizeOf(context).width > 600
                                  ? 50
                                  : null,
                              'assets/images/auth_images/emergency_images/whitecar.svg'),
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width > 600
                                ? 25
                                : 10,
                          ),
                          Text('Number of Car Accident',
                              style: AppStyle.styleSemiBold28(context).copyWith(
                                  color: Colors.white, fontFamily: 'Inter')),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: EdgeInsets.only(
                            left: MediaQuery.sizeOf(context).width > 600
                                ? 81
                                : 35),
                        child: Text('8 Accidents',
                            style: AppStyle.styleRegular25(context).copyWith(
                              color: Colors.white,
                              fontFamily: 'Roboto',
                            )),
                      ),
                    ],
                  ),
                ],
              ),
              Positioned(
                top: MediaQuery.sizeOf(context).width > 600 ? 60 : 45,
                right: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '+1%',
                      style: AppStyle.styleRegular25(context)
                          .copyWith(color: Colors.white),
                    ),
                    Text(
                      'from the last day',
                      style: AppStyle.styleRegular25(context)
                          .copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
