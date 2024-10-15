// ignore_for_file: body_might_complete_normally_nullable, empty_constructor_bodies

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_accident/constants/pages_name.dart';
import 'package:user_accident/logic/auth_cubit/auth_cubit.dart';
import 'package:user_accident/presentation/screens/forgot_password_screen.dart';
import 'package:user_accident/presentation/screens/on_boarding.dart';
import 'package:user_accident/presentation/screens/selecting_method_screen.dart';
import 'package:user_accident/presentation/screens/sign_in_screen.dart';
import 'package:user_accident/presentation/screens/splash_screen.dart';

class AppRouter {
  Route? generationRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(
            builder: (context) => const SplashScreen());

      case selectingMethodScreen:
        return MaterialPageRoute(
            builder: (context) => const SelectingMethodScreen());

      case onBoardingScreen:
        return MaterialPageRoute(
            builder: (context) => const OnBoardingScreen());

      case signInScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (BuildContext context) => AuthCubit(),
                  child: const SignInScreen(),
                ));

      case forgotPasswordScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (BuildContext context) => AuthCubit(),
                  child: const ForgotPasswordScreen(),
                ));
    }
  }
}
