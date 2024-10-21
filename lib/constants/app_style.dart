import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class AppStyle {

  static TextStyle styleBold17(BuildContext context) {
    return  TextStyle(
      color:const Color(0xFF333333),
      fontSize: 17.sp* MediaQuery.sizeOf(context).width*0.0008,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle styleBold16(BuildContext context) {
    return  TextStyle(
      color:const Color(0xFF5C5858),
      fontSize: 16.sp* MediaQuery.sizeOf(context).width*0.0008,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle styleBold20(BuildContext context) {
    return  TextStyle(
      color:const Color(0xFF5C5858),
      fontSize: 20.sp* MediaQuery.sizeOf(context).width*0.0008,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle styleBold25(BuildContext context) {
    return  TextStyle(
      color:const Color(0xFF5C5858),
      fontSize: 25.sp* MediaQuery.sizeOf(context).width*0.0008,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w700,
    );
  }


  static TextStyle styleRegular16(BuildContext context) {
    return  TextStyle(
      color:const Color(0xFF5C5858),
      fontSize: 16.sp* MediaQuery.sizeOf(context).width*0.0008,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleRegular12(BuildContext context) {
    return  TextStyle(
      color: const Color(0xFF5C5858),
      fontSize: 12.sp* MediaQuery.sizeOf(context).width*0.0008,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleSemiBold16(BuildContext context) {
    return  TextStyle(
      color:const Color(0xFF5C5858),
      fontSize: 16.sp* MediaQuery.sizeOf(context).width*0.0008,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleSemiBold18(BuildContext context) {
    return  TextStyle(
      color:const Color(0xFFFFFFFF),
      fontSize: 18.sp* MediaQuery.sizeOf(context).width*0.0008,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleSemiBold25(BuildContext context) {
    return  TextStyle(
      color:const Color(0xFFFFFFFF),
      fontSize: 25.sp* MediaQuery.sizeOf(context).width*0.0008,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleRegular25(BuildContext context) {
    return  TextStyle(
      color:const Color(0xFF000000),
      fontSize: 25.sp* MediaQuery.sizeOf(context).width*0.0009,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleRegular17(BuildContext context) {
    return  TextStyle(
      color:const Color(0xFF5C5858),
      fontSize: 17.sp* MediaQuery.sizeOf(context).width*0.0008,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
    );
  }

}