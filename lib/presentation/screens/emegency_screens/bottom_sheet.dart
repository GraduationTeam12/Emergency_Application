// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:user_accident/constants/app_style.dart';
import 'package:user_accident/constants/colors.dart';
import 'package:user_accident/constants/pages_name.dart';
import 'package:user_accident/presentation/models/bottom_sheet_model.dart';

class DraggableBottomSheet extends StatelessWidget {
  const DraggableBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    List<BottomSheetModel> buttons = [
      BottomSheetModel(
          bottomName: 'Settings',
          icon: Icons.settings,
          onPressed: () => Navigator.pushNamed(context, settingScreen)),
      BottomSheetModel(
          bottomName: 'Reports',
          icon: Icons.report,
          onPressed: () => Navigator.pushNamed(context, reportsScreen)),
      BottomSheetModel(
          bottomName: 'Notifications',
          icon: Icons.notifications,
          onPressed: () => Navigator.pushNamed(context, notificationsScreen)),
    ];
    return DraggableScrollableSheet(
      initialChildSize: 0.04,
      minChildSize: 0.035,
      maxChildSize: 0.13,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            physics: const ClampingScrollPhysics(),
            padding: EdgeInsets.zero,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.sizeOf(context).width * 0.02),
                  width: MediaQuery.sizeOf(context).width * 0.3,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.025,
                ),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: buttons.length,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: MediaQuery.sizeOf(context).width > 600
                            ? MediaQuery.sizeOf(context).width * 0.5
                            : MediaQuery.sizeOf(context).width * 0.61,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                      color: MyColors.premiumColor, width: 1),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                              onPressed: buttons[index].onPressed,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(buttons[index].icon,
                                      size:
                                          MediaQuery.sizeOf(context).width > 600
                                              ? 40
                                              : 22,
                                      color: MyColors.premiumColor),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  FittedBox(
                                    child: Text(
                                      buttons[index].bottomName,
                                      style: AppStyle.styleSemiBold18(context)
                                          .copyWith(
                                              color: MyColors.premiumColor),
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
