import 'package:flutter/material.dart';
import 'package:user_accident/constants/app_style.dart';
import 'package:user_accident/constants/pages_name.dart';
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
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        toolbarHeight: MediaQuery.sizeOf(context).height / 8,
        title: Text(
                  'Settings',
                  style: AppStyle.styleBold25(context).copyWith(color: Colors.black),
                ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Column(
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              children: [
                EmergencySettingListView(
                  leading: Text(
                    'Profile',
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
                  },
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).width > 600
                      ? MediaQuery.sizeOf(context).height * 0.02
                      : null,
                ),
                buildDrawerListItemsDivider(),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.02,
                ),
                EmergencySettingListView(
                  leading: Text(
                    'Reports',
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
                    Navigator.pushNamed(context, reportsScreen);
                  },
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).width > 600
                      ? MediaQuery.sizeOf(context).height * 0.02
                      : null,
                ),
                buildDrawerListItemsDivider(),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.02,
                ),
                EmergencySettingListView(
                  leading: Text(
                    'Contact Us',
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
                  },
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).width > 600
                      ? MediaQuery.sizeOf(context).height * 0.02
                      : null,
                ),
                buildDrawerListItemsDivider(),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.02,
                ),
                EmergencySettingListView(
                  leading: Text(
                    'Log Out',
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
                    showLogOutDialog(context);
                  },
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).width > 600
                      ? MediaQuery.sizeOf(context).height * 0.02
                      : null,
                ),
                buildDrawerListItemsDivider(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
