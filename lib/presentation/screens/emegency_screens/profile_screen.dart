// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_accident/constants/app_style.dart';
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

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<EmergenciesFeaturesCubit>().getEmergencyProfile();
    });
    super.initState();
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
          'حسابي',
          style: AppStyle.styleBold25(context).copyWith(color: Colors.black),
        ),
        centerTitle: true,
      ),
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
          return Column(
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Form(
                  // key: BlocProvider.of<AddOwnerCubit>(context).getUserInfoKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "اسم المستشفى",
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
                            disabledBorder: const UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.amber, width: 1.5),
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
                            disabledBorder: const UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.amber, width: 1.5),
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
                            disabledBorder: const UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.amber, width: 1.5),
                            ),
                            enabled: false),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      Text(
                        "بطاقة تعريف",
                        style: AppStyle.styleBold22(context)
                            .copyWith(color: Colors.black),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        initialValue: emergencyprofile!.phone,
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
                                      ? 50
                                      : null,
                                ),
                                const SizedBox(width: 4),
                              ],
                            ),
                            isDense: true,
                            disabledBorder: const UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.amber, width: 1.5),
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
          );
        },
      ),
    );
  }
}
