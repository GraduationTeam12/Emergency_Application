import 'package:flutter/material.dart';
import 'package:user_accident/constants/app_style.dart';
import 'package:user_accident/constants/colors.dart';
import 'package:user_accident/presentation/screens/emegency_screens/location_of_accident.dart';

void showUserInfoDialog(BuildContext context,
    {required final double lat,
    required final double long,
    required final String userName,
    required final String phoneNumber,
    required final String address,
    required final String nationalId,
    required final int age}) {
  showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          scrollable: true,
          titlePadding: EdgeInsets.zero,
          backgroundColor: Colors.white,
          content: SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: Column(
              children: [
                Form(
                  // key: BlocProvider.of<AddOwnerCubit>(context).getUserInfoKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "الاسم كامل",
                        style: AppStyle.styleBold22(context),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        initialValue: userName,
                        style: AppStyle.styleRegular17(context)
                            .copyWith(color: Colors.black),
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                            errorStyle: AppStyle.styleRegular17(context)
                                .copyWith(color: Colors.red),
                            prefixIconConstraints: const BoxConstraints(
                              minWidth: 0,
                              minHeight: 0,
                            ),
                            prefixIcon: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.person,
                                  color: Colors.black,
                                  size: MediaQuery.sizeOf(context).width > 600
                                      ? 40
                                      : null,
                                ),
                                const SizedBox(width: 4),
                              ],
                            ),
                            isDense: true,
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: MyColors.premiumColor, width: 1),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: MyColors.premiumColor, width: 1),
                            ),
                            enabled: false),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "البريد الالكتروني",
                        style: AppStyle.styleBold22(context),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        initialValue: 'hossaaamahmed6@gmail.com',
                        style: AppStyle.styleRegular17(context)
                            .copyWith(color: Colors.black),
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                            errorStyle: AppStyle.styleRegular16(context)
                                .copyWith(color: Colors.red),
                            prefixIconConstraints: const BoxConstraints(
                              minWidth: 0,
                              minHeight: 0,
                            ),
                            prefixIcon: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.email_outlined,
                                  color: Colors.black,
                                  size: MediaQuery.sizeOf(context).width > 600
                                      ? 40
                                      : null,
                                ),
                                const SizedBox(width: 4),
                              ],
                            ),
                            isDense: true,
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: MyColors.premiumColor, width: 1),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: MyColors.premiumColor, width: 1),
                            ),
                            enabled: false),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "الموقع",
                        style: AppStyle.styleBold22(context),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        initialValue: address,
                        style: AppStyle.styleRegular17(context)
                            .copyWith(color: Colors.black),
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                            errorStyle: AppStyle.styleRegular17(context)
                                .copyWith(color: Colors.red),
                            prefixIconConstraints: const BoxConstraints(
                              minWidth: 0,
                              minHeight: 0,
                            ),
                            prefixIcon: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: Colors.black,
                                  size: MediaQuery.sizeOf(context).width > 600
                                      ? 40
                                      : null,
                                ),
                                const SizedBox(width: 4),
                              ],
                            ),
                            isDense: true,
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: MyColors.premiumColor, width: 1),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: MyColors.premiumColor, width: 1),
                            ),
                            enabled: false),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "العمر",
                        style: AppStyle.styleBold22(context),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        initialValue: '$age',
                        style: AppStyle.styleRegular17(context)
                            .copyWith(color: Colors.black),
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                            errorStyle: AppStyle.styleRegular16(context)
                                .copyWith(color: Colors.red),
                            prefixIconConstraints: const BoxConstraints(
                              minWidth: 0,
                              minHeight: 0,
                            ),
                            prefixIcon: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.numbers,
                                  color: Colors.black,
                                  size: MediaQuery.sizeOf(context).width > 600
                                      ? 40
                                      : null,
                                ),
                                const SizedBox(width: 4),
                              ],
                            ),
                            isDense: true,
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: MyColors.premiumColor, width: 1),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: MyColors.premiumColor, width: 1),
                            ),
                            enabled: false),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "رقم الهاتف",
                        style: AppStyle.styleBold22(context),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        initialValue: phoneNumber,
                        style: AppStyle.styleRegular17(context)
                            .copyWith(color: Colors.black),
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                            errorStyle: AppStyle.styleRegular16(context)
                                .copyWith(color: Colors.red),
                            prefixIconConstraints: const BoxConstraints(
                              minWidth: 0,
                              minHeight: 0,
                            ),
                            prefixIcon: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.phone_iphone,
                                  color: Colors.black,
                                  size: MediaQuery.sizeOf(context).width > 600
                                      ? 40
                                      : null,
                                ),
                                const SizedBox(width: 4),
                              ],
                            ),
                            isDense: true,
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: MyColors.premiumColor, width: 1),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: MyColors.premiumColor, width: 1),
                            ),
                            enabled: false),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "الرقم القومي",
                        style: AppStyle.styleBold22(context),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        initialValue: nationalId,
                        style: AppStyle.styleRegular17(context)
                            .copyWith(color: Colors.black),
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                            errorStyle: AppStyle.styleRegular16(context)
                                .copyWith(color: Colors.red),
                            prefixIconConstraints: const BoxConstraints(
                              minWidth: 0,
                              minHeight: 0,
                            ),
                            prefixIcon: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.credit_card,
                                  color: Colors.black,
                                  size: MediaQuery.sizeOf(context).width > 600
                                      ? 40
                                      : null,
                                ),
                                const SizedBox(width: 4),
                              ],
                            ),
                            isDense: true,
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: MyColors.premiumColor, width: 1),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: MyColors.premiumColor, width: 1),
                            ),
                            enabled: false),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "رقم البورد",
                        style: AppStyle.styleBold22(context),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        initialValue: '9998542',
                        style: AppStyle.styleRegular17(context)
                            .copyWith(color: Colors.black),
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                            errorStyle: AppStyle.styleRegular16(context)
                                .copyWith(color: Colors.red),
                            prefixIconConstraints: const BoxConstraints(
                              minWidth: 0,
                              minHeight: 0,
                            ),
                            prefixIcon: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.credit_card,
                                  color: Colors.black,
                                  size: MediaQuery.sizeOf(context).width > 600
                                      ? 40
                                      : null,
                                ),
                                const SizedBox(width: 4),
                              ],
                            ),
                            isDense: true,
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: MyColors.premiumColor, width: 1),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: MyColors.premiumColor, width: 1),
                            ),
                            enabled: false),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LocationOfAccident(
                                  latOfAccidentLocation: lat,
                                  longOfAccidentLocation: long)));
                    },
                    child: Text(
                      "اذهب الي الموقع",
                      style: AppStyle.styleBold25(context).copyWith(
                        fontFamily: 'Inter',
                        color: MyColors.premiumColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      });
}
