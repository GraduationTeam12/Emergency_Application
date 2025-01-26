import 'package:flutter/material.dart';
import 'package:user_accident/constants/app_style.dart';

AppBar buildCustomAppBar(BuildContext context , String title) {
    return AppBar(
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: Colors.white,
      toolbarHeight: MediaQuery.sizeOf(context).height / 7,
      title: Center(
          child: Text(
        title,
        style: AppStyle.styleRegular25(context),
      )),
    );
  }