import 'package:flutter/material.dart';
import 'package:user_accident/constants/app_style.dart';
 

class NotificationsBody extends StatelessWidget {
  const NotificationsBody({
    super.key,
    required this.notifications,
  });

  final List<dynamic> notifications;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 20, vertical: 10),
            child: Container(
              height: MediaQuery.sizeOf(context).width > 600
                  ? 150
                  : 90,
              decoration: BoxDecoration(
                color: Colors.white ,
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
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [         
                    const SizedBox(width: 5),
                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          FittedBox(
                            child: Text(
                              notifications[index]['title'],
                              style: AppStyle.styleSemiBold25(
                                      context , )
                                  .copyWith(
                                      color: Colors.black),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              notifications[index]['message'],
                              style: AppStyle.styleRegular16(
                                      context)
                                  .copyWith(
                                      color: const Color(0xFF5C5858)),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ),
                        ],
                      ),
                    ),
    
                    // Button at bottom-right
                    // Column(
                    //   mainAxisAlignment: MainAxisAlignment.end,
                    //   children: [
                    //     const Spacer(),
                    //     SizedBox(
                    //       height: 27,
                    //       width: 90,
                    //       child: ElevatedButton(
                    //         style: ElevatedButton.styleFrom(
                    //           backgroundColor: Colors.amber,
                    //           shape: RoundedRectangleBorder(
                    //             borderRadius:
                    //                 BorderRadius.circular(10),
                    //           ),
                    //         ),
                    //         onPressed: () {
                    //           Navigator.pushNamed(
                    //               context, userInfoScreen);
                    //         },
                    //         child: FittedBox(
                    //           child: Text(
                    //             'Check',
                    //             style:
                    //                 AppStyle.styleRegular30(context)
                    //                     .copyWith(
                    //                         color: Colors.white),
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ),
            ),
          );
        },
      );
  }
}