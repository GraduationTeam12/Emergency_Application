// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:user_accident/presentation/widgets/selecting_method_build_custom_button.dart';
import 'package:user_accident/presentation/widgets/selecting_method_section.dart';

class SelectingMethodScreen extends StatelessWidget {
  const SelectingMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [

              Expanded(
                child: SizedBox(
                  height: 20,
                ),
              ),
              SelectingMethodSection(),

              Spacer(),
              OwnerButton(),
              SizedBox(
                height: 20,
              ),
              EmergencyButton(),
              Expanded(
                child: SizedBox(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


