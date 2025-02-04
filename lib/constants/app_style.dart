import 'package:flutter/material.dart';

abstract class AppStyle {
  static TextStyle styleBold17(BuildContext context) {
    return  TextStyle(
      color: const Color(0xFF333333),
      fontSize: getResponsiveFontSize(context , fontSize: 17),
      fontFamily: 'Inter',
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle styleBold16(BuildContext context) {
    return  TextStyle(
      color: const Color(0xFF5C5858),
      fontSize: getResponsiveFontSize(context , fontSize: 16),
      fontFamily: 'Inter',
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle styleBold20(BuildContext context) {
    return  TextStyle(
      color: const Color(0xFF5C5858),
      fontSize: getResponsiveFontSize(context , fontSize: 20),
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle styleBold22(BuildContext context) {
    return  TextStyle(
      color: const Color(0xFF5C5858),
      fontSize: getResponsiveFontSize(context , fontSize: 22),
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle styleBold25(BuildContext context) {
    return  TextStyle(
      color: const Color(0xFF5C5858),
      fontSize: getResponsiveFontSize(context , fontSize: 30),
      fontFamily: 'Inter',
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle styleRegular16(BuildContext context) {
    return TextStyle(
      color: const Color(0xFF5C5858),
      fontSize: getResponsiveFontSize(context , fontSize: 16),
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleRegular12(BuildContext context) {
    return TextStyle(
      color: const Color(0xFF5C5858),
      fontSize: getResponsiveFontSize(context , fontSize: 12),
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleSemiBold16(BuildContext context) {
    return TextStyle(
      color: const Color(0xFF5C5858),
      fontSize: getResponsiveFontSize(context , fontSize: 16),
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleSemiBold18(BuildContext context) {
    return TextStyle(
      color: const Color(0xFFFFFFFF),
      fontSize: getResponsiveFontSize(context , fontSize: 18),
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleSemiBold25(BuildContext context) {
    return TextStyle(
      color: const Color(0xFFFFFFFF),
      fontSize: getResponsiveFontSize(context , fontSize: 25),
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleSemiBold28(BuildContext context) {
    return TextStyle(
      color: const Color(0xFFFFFFFF),
      fontSize: getResponsiveFontSize(context , fontSize: 28),
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleSemiBold20(BuildContext context) {
    return TextStyle(
      color: const Color(0xFF000000),
      fontSize: getResponsiveFontSize(context , fontSize: 20),
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleRegular30(BuildContext context) {
    return TextStyle(
      color: const Color(0xFF000000),
      fontSize: getResponsiveFontSize(context , fontSize: 30),
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleRegular25(BuildContext context) {
    return TextStyle(
      color: const Color(0xFF000000),
      fontSize: getResponsiveFontSize(context , fontSize: 25),
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleRegular17(BuildContext context) {
    return TextStyle(
      color: const Color(0xFF5C5858),
      fontSize: getResponsiveFontSize(context , fontSize: 17),
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
    );
  }

    static TextStyle styleRegular20(BuildContext context) {
    return TextStyle(
      color: const Color(0xFF5C5858),
      fontSize: getResponsiveFontSize(context , fontSize: 20),
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
    );
  }
}

double getResponsiveFontSize(BuildContext context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = fontSize * scaleFactor;

  double lowerLimit = fontSize * .8;
  double upperLimit = fontSize * 2;

  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(BuildContext context) {
  double width = MediaQuery.sizeOf(context).width;

  if (width < 800) {
    return width / 500;
  } else if (width < 1200) {
    return width / 600;
  } else {
    return width / 700;
  }
}
