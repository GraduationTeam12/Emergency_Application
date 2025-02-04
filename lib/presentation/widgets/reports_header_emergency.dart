import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:user_accident/constants/app_style.dart';
import 'package:user_accident/constants/colors.dart';
import 'package:user_accident/presentation/widgets/calendar.dart';

class ReportsHeaderEmergency extends StatelessWidget {
  const ReportsHeaderEmergency({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).width > 600 ? 80 : null,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: MyColors.premiumColor),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Dialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        backgroundColor: Colors.white,
                        child: SizedBox(
                          height: MediaQuery.sizeOf(context).width > 1000
                              ? 600
                              : MediaQuery.sizeOf(context).height * 0.65,
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: const CalendarWidget(),
                        ),
                      );
                    });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_month_outlined,
                        color: Colors.white,
                        size: MediaQuery.sizeOf(context).width > 600 ? 50 : 20,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        'يوميًا',
                        style: AppStyle.styleRegular25(context).copyWith(
                            color: Colors.white, fontFamily: 'Roboto'),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  SvgPicture.asset(
                      height:
                          MediaQuery.sizeOf(context).width > 600 ? 26 : null,
                      width: MediaQuery.sizeOf(context).width > 600 ? 26 : null,
                      'assets/images/auth_images/emergency_images/arrowbottom.svg')
                ],
              )),
        )
      ],
    );
  }
}
