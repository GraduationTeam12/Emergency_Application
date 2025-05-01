import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:user_accident/constants/app_images.dart';
import 'package:user_accident/constants/app_style.dart';
import 'package:user_accident/constants/colors.dart';
import 'package:user_accident/constants/pages_name.dart';
import 'package:user_accident/presentation/screens/emegency_screens/places_screen.dart';
import 'package:user_accident/presentation/widgets/emergency_setting_list_view.dart';
import 'package:user_accident/presentation/widgets/logout_dialog.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Widget buildDrawerListItemsDivider() {
    return const Divider(
      height: 0,
      color: Colors.amber,
      thickness: 1,
      indent: 18,
      endIndent: 24,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.sizeOf(context).height / 10),
        child: Container(
          decoration: BoxDecoration(
              boxShadow: [
              BoxShadow(blurRadius: 4,offset: Offset(0, 4),spreadRadius: 0,color: Colors.black26)
            ],
            color: MyColors.premiumColor,
             borderRadius: BorderRadius.only( bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30),)
          ),
          child: AppBar(
            elevation: 0,
            scrolledUnderElevation: 0,
            backgroundColor: Colors.transparent,
            toolbarHeight: MediaQuery.sizeOf(context).height / 10,
            title: Text(
              'الاعدادات',
              style: AppStyle.styleBold25(context).copyWith(color: Colors.white),
            ),
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_outlined,color: Colors.white,),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Container(
          //   width: double.infinity,
          //   height: 2,
          //   decoration: BoxDecoration(
          //     color: Colors.grey[400],
          //     boxShadow: [
          //       BoxShadow(
          //         color: Colors.black.withOpacity(0.3),
          //         spreadRadius: 1,
          //         blurRadius: 3,
          //         offset: const Offset(0, 2),
          //       ),
          //     ],
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:const BorderRadius.only(bottomRight: Radius.circular(10),bottomLeft: Radius.circular(10),),
                boxShadow: [
                   BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      spreadRadius: 0,
                      blurRadius: 4,
                      offset: const Offset(0, 4),
                    ),
                ]
              ),
              child: Column(
                children: [
                    EmergencySettingListView(
                    leading: Text(
                      'حساب الطوارئ',
                      style: AppStyle.styleRegular25(context).copyWith(fontWeight: FontWeight.w700),
                    ),
                    trailing: Transform.rotate(
                      angle: -1.5708 * 2,
                      child: Icon(
                        Icons.arrow_back_ios_new_outlined,
                        color: Colors.white,
                        size: MediaQuery.sizeOf(context).width > 600 ? 50 : 20,
                      ),
                    ), onTap: () {  }, 
                    imageIcon: 
                      SvgPicture.asset(
                          Assets.imagesAuthImagesEmergencyHospitalIcon,
                          width: MediaQuery.sizeOf(context).width > 600 ? 50 : 20,
                          height: MediaQuery.sizeOf(context).width > 600 ? 50 : 20,
                        )
                    ,
                    
                  ),
                  
                  Divider(color: Color(0xff3D649880),),
                  EmergencySettingListView(
                    leading: Text(
                      'الملف التعريفي',
                      style: AppStyle.styleRegular25(context),
                    ),
                    trailing: Transform.rotate(
                      angle: -1.5708 * 2,
                      child: Icon(
                        Icons.arrow_back_ios_new_outlined,
                        color: Colors.black,
                        size: MediaQuery.sizeOf(context).width > 600 ? 50 : 20,
                      ),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, emergencyProfileScreen);
                    }, imageIcon: 
                      SvgPicture.asset(
                          Assets.imagesAuthImagesEmergencyImagesAddIcon,
                          width: MediaQuery.sizeOf(context).width > 600 ? 50 : 20,
                          height: MediaQuery.sizeOf(context).width > 600 ? 50 : 20,
                        )
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).width > 600
                        ? MediaQuery.sizeOf(context).height * 0.02
                        : null,
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.02,
                  ),
              EmergencySettingListView(
                    leading: Text(
                      'المرضى',
                      style: AppStyle.styleRegular25(context),
                    ),
                    trailing: Transform.rotate(
                      angle: -1.5708 * 2,
                      child: Icon(
                        Icons.arrow_back_ios_new_outlined,
                        color: Colors.black,
                        size: MediaQuery.sizeOf(context).width > 600 ? 50 : 20,
                      ),
                    ),
                    onTap: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => const PlacesScreen(),));
                      //Navigator.pushNamed(context, contactWithAdminScreen);
                    }, imageIcon: 
                      SvgPicture.asset(
                          Assets.imagesAuthImagesEmergencyImagesEmojisHospital,
                          width: MediaQuery.sizeOf(context).width > 600 ? 50 : 20,
                          height: MediaQuery.sizeOf(context).width > 600 ? 50 : 20,
                        )
                  ),
                
               SizedBox(
                    height: MediaQuery.sizeOf(context).width > 600
                        ? MediaQuery.sizeOf(context).height * 0.02
                        : null,
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.02,
                  ),
                    EmergencySettingListView(
                    leading: Text(
                      'التواصل مع المسؤول',
                      style: AppStyle.styleRegular25(context),
                    ),
                    trailing: Transform.rotate(
                      angle: -1.5708 * 2,
                      child: Icon(
                        Icons.arrow_back_ios_new_outlined,
                        color: Colors.black,
                        size: MediaQuery.sizeOf(context).width > 600 ? 50 : 20,
                      ),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, contactWithAdminScreen);
                      // Navigator.pushNamed(context, reportsScreen);
                    }, 
                    imageIcon: 
                      SvgPicture.asset(
                          Assets.imagesAuthImagesEmergencyImagesAdministrator,
                          width: MediaQuery.sizeOf(context).width > 600 ? 50 : 20,
                          height: MediaQuery.sizeOf(context).width > 600 ? 50 : 20,
                        )
                  ),
                    
                  SizedBox(
                    height: MediaQuery.sizeOf(context).width > 600
                        ? MediaQuery.sizeOf(context).height * 0.02
                        : null,
                  ),
                
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.02,
                  ),
                  // EmergencySettingListView(
                  //   leading: Text(
                  //     'تسجيل الخروج',
                  //     style: AppStyle.styleRegular25(context),
                  //   ),
                  //   trailing: Transform.rotate(
                  //     angle: -1.5708 * 2,
                  //     child: Icon(
                  //       Icons.arrow_back_ios_new_outlined,
                  //       color: Colors.black,
                  //       size: MediaQuery.sizeOf(context).width > 600 ? 50 : 20,
                  //     ),
                  //   ),
                  //   onTap: () {
                  //     showLogOutDialog(context);
                  //   },
                  // ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).width > 600
                        ? MediaQuery.sizeOf(context).height * 0.02
                        : null,
                  ),
                ],
              ),
            ),
          )
        ,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Text(
          'أعدادات أخرى',
          style: AppStyle.styleRegular25(context).copyWith(
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),),
          SizedBox(height: 5,),
           Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              spreadRadius: 0,
              blurRadius: 4,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: GestureDetector(
          onTap: () {
            showLogOutDialog(context);
          },
          child: Align(
            alignment: Alignment.centerRight,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal:12),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Color(0xffFFBD00),
                borderRadius: BorderRadius.circular(10),
                
                
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'تسجيل الخروج',
                    style: AppStyle.styleRegular25(context).copyWith(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 8),
                  Icon(Icons.logout, color: Colors.white),
                ],
              ),
            ),
          ),
        ))
            ],
          ),
        )
      ],
      ),
    );
  }
}
