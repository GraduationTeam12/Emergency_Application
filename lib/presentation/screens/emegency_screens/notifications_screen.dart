// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:user_accident/constants/app_style.dart';
import 'package:user_accident/constants/colors.dart';
import 'package:user_accident/constants/pages_name.dart';
import 'package:user_accident/presentation/models/notification_model.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  static List<NotificationModel> items = [
    NotificationModel(
        name: 'Ayman Makram',
        location: 'Plateau, Al Haram, Giza Governorate, Egypt',
        img: 'assets/images/auth_images/emergency_images/aymanjpg.jpg'),
    NotificationModel(
        name: 'Ayman Makram',
        location: 'Plateau, Al Haram, Giza Governorate, Egypt',
        img: 'assets/images/auth_images/emergency_images/ayman2.jpg'),
    NotificationModel(
        name: 'Ayman Makram',
        location: 'Plateau, Al Haram, Giza Governorate, Egypt',
        img: 'assets/images/auth_images/emergency_images/ayman3.jpg'),
    NotificationModel(
        name: 'Ayman Makram',
        location: 'Plateau, Al Haram, Giza Governorate, Egypt',
        img: 'assets/images/auth_images/emergency_images/ayman4.jpg'),
    NotificationModel(
        name: 'Ayman Makram',
        location: 'Plateau, Al Haram, Giza Governorate, Egypt',
        img: 'assets/images/auth_images/emergency_images/aymanjpg.jpg'),
    NotificationModel(
        name: 'Ayman Makram',
        location: 'Plateau, Al Haram, Giza Governorate, Egypt',
        img: 'assets/images/auth_images/emergency_images/ayman2.jpg'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        toolbarHeight: MediaQuery.sizeOf(context).height / 8,
        title: Center(
            child: Text(
          'Notification',
          style: AppStyle.styleBold25(context).copyWith(color: Colors.black),
        )),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 2,
              decoration: BoxDecoration(
                color: Colors.grey[400],
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Container(
                    height: MediaQuery.sizeOf(context).width > 600 ? 150 : 100,
                    decoration: BoxDecoration(
                      color: MyColors.premiumColor.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4,
                          offset: Offset(0, 4),
                        )
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipOval(
                              child: Image.asset(
                                  width: MediaQuery.of(context).size.width > 600
                                      ? 100
                                      : 60,
                                  height:
                                      MediaQuery.of(context).size.width > 600
                                          ? 100
                                          : 60,
                                  fit: BoxFit.cover,
                                  items[index].img)),

                          const SizedBox(width: 5),

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text('    ',
                                        style: TextStyle(
                                          fontSize:
                                              MediaQuery.sizeOf(context).width >
                                                      600
                                                  ? 35
                                                  : 20,
                                        )),
                                    FittedBox(
                                      child: Text(
                                        items[index].name,
                                        style: AppStyle.styleSemiBold25(context)
                                            .copyWith(color: Colors.amber),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.place_outlined,
                                      color: Colors.amber,
                                      size:
                                          MediaQuery.sizeOf(context).width > 600
                                              ? 35
                                              : 20,
                                    ),
                                    Expanded(
                                      child: Text(
                                        items[index].location,
                                        style: AppStyle.styleRegular16(context)
                                            .copyWith(color: Colors.white),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          // Button at bottom-right
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Spacer(),
                              SizedBox(
                                height: 27,
                                width: 90,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.amber,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.pushNamed(context, userInfoScreen);
                                  },
                                  child: FittedBox(
                                    child: Text(
                                      'Check',
                                      style: AppStyle.styleRegular25(context)
                                          .copyWith(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
