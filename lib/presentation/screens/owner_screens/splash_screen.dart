//

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:user_accident/constants/pages_name.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, selectingMethodScreen);
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(builder: (context) =>const SelectingMethodScreen()),
      // );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
      // backgroundColor: const Color.fromARGB(255, 209, 240, 254),
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: Lottie.asset('assets/images/auth_images/Flow 6 (3).json',
            fit: BoxFit.contain, repeat: false),
      ),
    );
  }
}
