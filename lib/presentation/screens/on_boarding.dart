import 'package:flutter/material.dart';
import 'package:user_accident/constants/app_style.dart';
import 'package:user_accident/presentation/widgets/on_boarding_section.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          toolbarHeight: MediaQuery.sizeOf(context).height / 8,
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Skip",
                    style: AppStyle.styleBold16(context),
                  )),
            )
          ],
        ),
        body: const OnBoardingSection()
      ),
    );
  }
}

