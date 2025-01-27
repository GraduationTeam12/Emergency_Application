// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:user_accident/constants/app_style.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({super.key});

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        toolbarHeight: MediaQuery.sizeOf(context).height / 8,
        title: Text(
                  "User's Data",
                  style: AppStyle.styleBold25(context).copyWith(color: Colors.black),
                ),

        centerTitle: true,
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

                 Padding(padding: const EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
                 child:   Form(
                    // key: BlocProvider.of<AddOwnerCubit>(context).getUserInfoKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "full name",
                          style: AppStyle.styleBold17(context).copyWith(color: Colors.black),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextFormField(
                          initialValue: 'Samasaber' ,
                          style: AppStyle.styleRegular16(context)
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
                              prefixIcon:   Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.person,
                                    color: Colors.black,
                                    size: MediaQuery.sizeOf(context).width > 600 ? 60 : null,
                                  ),
                                  const SizedBox(width: 4),
                                ],
                              ),
                              isDense: true,
                               disabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.amber, width: 1.5),
                             ),
                              enabled: false),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          "E-mail",
                          style: AppStyle.styleBold17(context).copyWith(color: Colors.black),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextFormField(
                          initialValue: 'Samasaber@gmail.com',
                          style: AppStyle.styleRegular16(context)
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
                              prefixIcon:   Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.email_outlined,
                                    color: Colors.black,
                                    size: MediaQuery.sizeOf(context).width > 600 ? 60 : null,
                                  ),
                                  const SizedBox(width: 4),
                                ],
                              ),
                              isDense: true,
                             disabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.amber, width: 1.5),
                             ),
                              enabled: false),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Location",
                          style: AppStyle.styleBold17(context).copyWith(color: Colors.black),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextFormField(
                          initialValue:  
                               'Giza Plateau, Al Haram, Giza Governorate, Egypt'
                               ,
                          style: AppStyle.styleRegular16(context)
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
                              prefixIcon:   Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    color: Colors.black,
                                    size: MediaQuery.sizeOf(context).width > 600 ? 60 : null,
                                  ),
                                  const SizedBox(width: 4),
                                ],
                              ),
                              isDense: true,
                               disabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.amber, width: 1.5),
                             ),
                              enabled: false),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Age",
                          style: AppStyle.styleBold17(context).copyWith(color: Colors.black),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextFormField(
                          initialValue:  
                             '22'
                               ,
                          style: AppStyle.styleRegular16(context)
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
                              prefixIcon:   Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.numbers,
                                    color: Colors.black,
                                    size: MediaQuery.sizeOf(context).width > 600 ? 60 : null,
                                  ),
                                  const SizedBox(width: 4),
                                ],
                              ),
                              isDense: true,
                             disabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.amber, width: 1.5),
                             ),
                              enabled: false),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Phone Number",
                          style: AppStyle.styleBold17(context).copyWith(color: Colors.black),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextFormField(
                          initialValue:  
                               '01207619792',
                          style: AppStyle.styleRegular16(context)
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
                              prefixIcon:   Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.phone_iphone,
                                    color: Colors.black,
                                    size: MediaQuery.sizeOf(context).width > 600 ? 50 : null,
                                  ),
                                  const SizedBox(width: 4),
                                ],
                              ),
                              isDense: true,
                               disabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.amber, width: 1.5),
                             ),
                              enabled: false),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Id",
                          style: AppStyle.styleBold17(context).copyWith(color: Colors.black),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextFormField(
                          initialValue:  
                             '300125487964',
                          style: AppStyle.styleRegular16(context)
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
                              prefixIcon:   Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.credit_card,
                                    color: Colors.black,
                                    size: MediaQuery.sizeOf(context).width > 600 ? 60 : null,
                                  ),
                                  const SizedBox(width: 4),
                                ],
                              ),
                              isDense: true,
                             disabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.amber, width: 1.5),
                             ),
                              enabled: false),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Board Number",
                          style: AppStyle.styleBold17(context).copyWith(color: Colors.black),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TextFormField(
                           
                          initialValue:  
                               '9998542',
                          style: AppStyle.styleRegular16(context)
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
                              prefixIcon:   Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.credit_card,
                                    color: Colors.black,
                                    size: MediaQuery.sizeOf(context).width > 600 ? 60 : null,
                                  ),
                                  const SizedBox(width: 4),
                                ],
                              ),
                              isDense: true,
                             
                             disabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.amber, width: 1.5),
                             ),
                              enabled: false),
                        ),
                      ],
                    ),
                  ),
                 )
          ],
        ),
      ),
    );
  }
}