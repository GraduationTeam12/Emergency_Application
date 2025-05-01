// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:user_accident/constants/app_images.dart';
import 'package:user_accident/constants/app_style.dart';
import 'package:user_accident/constants/colors.dart';
import 'package:user_accident/core/cache/cache_helper.dart';
import 'package:user_accident/core/data/model/emergency_profile_model.dart';
import 'package:user_accident/core/logic/emergencies_features/emergencies_features_cubit.dart';
import 'package:user_accident/core/logic/emergencies_features/emergencies_features_state.dart';

class EmergencyProfileScreen extends StatefulWidget {
  const EmergencyProfileScreen({super.key});

  @override
  State<EmergencyProfileScreen> createState() => _EmergencyProfileScreenState();
}

class _EmergencyProfileScreenState extends State<EmergencyProfileScreen> {
  EmergencyProfileModel? emergencyprofile;
  String? userType;

  @override
  

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<EmergenciesFeaturesCubit>().getEmergencyProfile();
    });
    userType = CacheHelper().getData(key: 'userType');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      backgroundColor: Colors.white,
      body: BlocConsumer<EmergenciesFeaturesCubit, EmergenciesFeaturesState>(
        listener: (context, state) {
          if (state is EmergencyProfileSuccess) {
            emergencyprofile = state.emergency;
          }
          if (state is EmergencyProfileUpdated) {
            emergencyprofile = state.emergency;
          }

          if (state is EmergencyProfileError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message.toString())),
            );
          }
        },
        builder: (context, state) {
          if (state is EmergencyProfileLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (emergencyprofile == null) {
            return const Center(
              child: Center(child: Text('No data available')),
            );
          }
          return SizedBox(
            height: MediaQuery.sizeOf(context).height,
            width:  MediaQuery.sizeOf(context).width,
            child: Stack(
              
              children: [
                Container(
                  height: MediaQuery.sizeOf(context).height / 5,
                  width: double.infinity,
                  decoration: BoxDecoration(color: MyColors.premiumColor),
                ),
                Positioned(
                  top: kToolbarHeight,
                  right: 8,
                  child: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back_ios,color: Colors.white,)))
,
                Positioned(
                  top: MediaQuery.sizeOf(context).height>1000&&MediaQuery.sizeOf(context).width>800?MediaQuery.sizeOf(context).height / 6-30:MediaQuery.sizeOf(context).height / 5-45,
                  right:  MediaQuery.sizeOf(context).height>1000&&MediaQuery.sizeOf(context).width>800?225:120+20,
                  child: Text( emergencyprofile!.name ,
                    style: AppStyle.styleBold22(context)
                        .copyWith(color: Colors.white),
                  ),
                ),
                Positioned(
                  top: MediaQuery.sizeOf(context).height / 5 ,
                  left:0,  
                  right: 0,
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
                      SizedBox(height: MediaQuery.sizeOf(context).height>1000&&MediaQuery.sizeOf(context).width>800?120: 70,),
                      Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Form(
                          // key: BlocProvider.of<AddOwnerCubit>(context).getUserInfoKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                      (userType == "hospitals")
                          ? "اسم المستشفى"
                          : (userType == "firestations")
                              ? "اسم وحدة الإطفاء"
                              : (userType == "cranes")
                                  ? "اسم وحدة الإنقاذ":

                                "اسم وحدة الطوارئ",
                                style: AppStyle.styleBold22(context)
                                    .copyWith(color: Colors.black),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              TextFormField(
                                initialValue: emergencyprofile!.name,
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
                                        SizedBox(
                                          width: MediaQuery.sizeOf(context).width > 600
                                              ? 20
                                              : 10,
                                        ),
                                        Icon(
                                          Icons.local_hospital,
                                          color: Colors.black,
                                          size: MediaQuery.sizeOf(context).width > 600
                                              ? 50
                                              : 20,
                                        ),
                                        const SizedBox(width: 4),
                                      ],
                                    ),
                                    isDense: true,
                                    disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12), 
                                      borderSide: BorderSide(
                                        color:  Color(0xff5C5858),
                                        width: 1,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12), 
                                      borderSide: BorderSide(
                                        color: Color(0xff5C5858),
                                        width: 1,
                                      ),
                                    ),
                                    enabled: false),
                              ),
                              const SizedBox(
                                height: 18,
                              ),
                              Text(
                                "البريد الإلكتروني",
                                style: AppStyle.styleBold22(context)
                                    .copyWith(color: Colors.black),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              TextFormField(
                                initialValue: emergencyprofile!.email,
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
                                        SizedBox(
                                          width: MediaQuery.sizeOf(context).width > 600
                                              ? 20
                                              : 10,
                                        ),
                                        Icon(
                                          Icons.email_outlined,
                                          color: Colors.black,
                                          size: MediaQuery.sizeOf(context).width > 600
                                              ? 50
                                              : null,
                                        ),
                                        const SizedBox(width: 4),
                                      ],
                                    ),
                                    isDense: true,
                                    disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12), 
                                      borderSide: BorderSide(
                                        color:  Color(0xff5C5858),
                                        width: 1,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12), 
                                      borderSide: BorderSide(
                                        color: Color(0xff5C5858),
                                        width: 1,
                                      ),
                                    ),
                                    enabled: false),
                              ),
                              const SizedBox(
                                height: 18,
                              ),
                              Text(
                                "الموقع",
                                style: AppStyle.styleBold22(context)
                                    .copyWith(color: Colors.black),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              TextFormField(
                                initialValue: emergencyprofile!.address,
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
                                        SizedBox(
                                          width: MediaQuery.sizeOf(context).width > 600
                                              ? 20
                                              : 10,
                                        ),
                                        Icon(
                                          Icons.location_on,
                                          color: Colors.black,
                                          size: MediaQuery.sizeOf(context).width > 600
                                              ? 50
                                              : null,
                                        ),
                                        const SizedBox(width: 4),
                                      ],
                                    ),
                                    isDense: true,
                                      disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12), 
                                      borderSide: BorderSide(
                                        color:  Color(0xff5C5858),
                                        width: 1,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12), 
                                      borderSide: BorderSide(
                                        color: Color(0xff5C5858),
                                        width: 1,
                                      ),
                                    ),
                                    enabled: false),
                              ),
                              const SizedBox(
                                height: 18,
                              ),
                              Text(
                                "الرقم تعريف",
                                style: AppStyle.styleBold22(context)
                                    .copyWith(color: Colors.black),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              TextFormField(
                                initialValue: emergencyprofile!.number.toString(),
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
                                        SizedBox(
                                          width: MediaQuery.sizeOf(context).width > 600
                                              ? 20
                                              : 10,
                                        ),
                                        Icon(
                                          Icons.credit_card,
                                          color: Colors.black,
                                          size: MediaQuery.sizeOf(context).width > 600
                                              ? 50
                                              : null,
                                        ),
                                        const SizedBox(width: 4),
                                      ],
                                    ),
                                    isDense: true,
                                      disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12), 
                                      borderSide: BorderSide(
                                        color:  Color(0xff5C5858),
                                        width: 1,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12), 
                                      borderSide: BorderSide(
                                        color: Color(0xff5C5858),
                                        width: 1,
                                      ),
                                    ),
                                    enabled: false),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  top:  MediaQuery.sizeOf(context).height>1000&&MediaQuery.sizeOf(context).width>800?MediaQuery.sizeOf(context).height / 5-100:MediaQuery.sizeOf(context).height / 5-60,
                  right: 10,
                  child: Container(
                    height: MediaQuery.sizeOf(context).height>1000&&MediaQuery.sizeOf(context).width>800?200: 120,
                    width: MediaQuery.sizeOf(context).height>1000&&MediaQuery.sizeOf(context).width>800?200: 120,
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(120),
                      
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(120),
                      child: Image.asset(
                        Assets.imagesAuthImagesEmergencyImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                
              ],
            ),
          );
        },
      ),
    );
  }
}
