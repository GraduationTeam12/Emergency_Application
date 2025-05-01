import 'package:flutter/material.dart';
import 'package:user_accident/constants/app_style.dart';
import 'package:user_accident/constants/colors.dart';
import 'package:user_accident/presentation/screens/emegency_screens/location_of_accident.dart';

class InformationPerson extends StatefulWidget {
  const InformationPerson( 
      {super.key,
      required this.lat,
      required this.long,
      required this.userName,
      required this.email,
      required this.phoneNumber,
      required this.address,
      required this.nationalId,
      required this.age});
  final double lat;
  final double long;
  final String userName;
  final String phoneNumber;
  final String address;
  final String email;
  final String nationalId;
  final int age;

  @override
  State<InformationPerson> createState() => _InformationPersonState();
}

class _InformationPersonState extends State<InformationPerson> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.sizeOf(context).height / 10),
        child: Container(
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    blurRadius: 4,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                    color: Colors.black26)
              ],
              color: MyColors.premiumColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              )),
          child: AppBar(
            elevation: 0,
            scrolledUnderElevation: 0,
            backgroundColor: Colors.transparent,
            toolbarHeight: MediaQuery.sizeOf(context).height / 10,
            title: Text(
              'المعلومات',
              style:
                  AppStyle.styleBold25(context).copyWith(color: Colors.white),
            ),
            centerTitle: true,
            leading: IconButton(
              icon:  Icon(
                Icons.arrow_back_ios_new_outlined,
                color: Colors.white,
                  size: MediaQuery.sizeOf(context).width > 600
                                    ? 40
                                    : null,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SingleChildScrollView(
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
                      initialValue: widget.userName,
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
                      initialValue: widget.email,
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
                      initialValue: widget.address,
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
                      initialValue: '${widget.age}',
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
                      initialValue: widget.phoneNumber,
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
                      initialValue:widget. nationalId,
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
                      height: 40,
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
                                latOfAccidentLocation:widget. lat,
                                longOfAccidentLocation: widget.long)));
                  },
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: MyColors.premiumColor,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(offset: Offset(0, 4),blurRadius: 4,spreadRadius: 0,color: Colors.black26)
                      ]
                    ),
                    child: Text(
                      "اذهب الي الموقع",
                      style: AppStyle.styleBold25(context).copyWith(
                        fontFamily: 'Inter',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
