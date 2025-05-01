import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:user_accident/constants/app_images.dart';
import 'package:user_accident/constants/app_style.dart';
import 'package:user_accident/presentation/screens/emegency_screens/information_person.dart';
import 'package:user_accident/presentation/widgets/dialog_info_user_accident.dart';

class NotificationsBody extends StatelessWidget {
  const NotificationsBody({
    super.key,
    required this.notifications,
  });

  final List<dynamic> notifications;

  @override
  Widget build(BuildContext context) {
    final groupedNotifications = <String, List<dynamic>>{};

for (var notification in notifications) {
  final date = DateTime.parse(notification['createdAt']).toLocal();
  final dateString = DateFormat.yMMMMd('ar').format(date);

  groupedNotifications.putIfAbsent(dateString, () => []).add(notification);
}

final dateKeys = groupedNotifications.keys.toList()
  ..sort((a, b) => DateFormat.yMMMMd('ar').parse(b).compareTo(DateFormat.yMMMMd('ar').parse(a)));

    return  ListView.builder(
  shrinkWrap: true,
  physics: const NeverScrollableScrollPhysics(),
  itemCount: dateKeys.length,
  itemBuilder: (context, dateIndex) {
    final dateKey = dateKeys[dateIndex];
    final dayNotifications = groupedNotifications[dateKey]!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          child: Text(
            dateKey,
            style: AppStyle.styleBold16(context).copyWith(color: Colors.black),
          ),
        ),
        ...dayNotifications.map((notification) {
          final lat = notification['sensors']['gps']['lat'];
          final long = notification['sensors']['gps']['long'];

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: InkWell(
              onTap: () {
                
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => InformationPerson(
                  lat: lat,
                  long: long,
                  userName: notification['user']['username'],
                  email: notification['user']['email'],
                  phoneNumber: notification['user']['phone'],
                  address: notification['user']['address'],
                  nationalId: notification['user']['nationalId'],
                  age: notification['user']['age'],),
                ));
                // showUserInfoDialog(
                //   context,
                //   lat: lat,
                //   long: long,
                //   userName: notification['user']['username'],
                //   phoneNumber: notification['user']['phone'],
                //   address: notification['user']['address'],
                //   nationalId: notification['user']['nationalId'],
                //   age: notification['user']['age'],
                // );
              },
              child: Container(
                height: MediaQuery.sizeOf(context).width > 600 ? 150 : 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: const Color(0xffDD2E4).withOpacity(0.15),
                  ),
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
                    children: [
                      const SizedBox(width: 5),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FittedBox(
                              child: Text(
                                notification['title'],
                                style: AppStyle.styleSemiBold25(context)
                                    .copyWith(color: Colors.black),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                notification['message'],
                                style: AppStyle.styleRegular16(context)
                                    .copyWith(color: const Color(0xFF5C5858)),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 5),
                      Image.asset(
                        Assets.imagesAuthImagesEmergencyImageFire,
                        height: 50,
                        width: 50,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ],
    );
  },
);
}
}
