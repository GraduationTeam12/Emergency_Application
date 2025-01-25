
// ignore_for_file: body_might_complete_normally_nullable, empty_constructor_bodies

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_accident/constants/pages_name.dart';
import 'package:user_accident/core/api/dio_consumer.dart';
import 'package:user_accident/core/data/repo/auth_repo.dart';
import 'package:user_accident/core/logic/forgot_password_cubit/cubit/forgot_password_cubit.dart';
import 'package:user_accident/core/logic/login_cubit/login_cubit.dart';
import 'package:user_accident/presentation/screens/emegency_screens/emergency_sign_in_screen.dart';
import 'package:user_accident/presentation/screens/owner_screens/change_password.dart';
import 'package:user_accident/presentation/screens/owner_screens/forgot_password_phone_screen.dart';
import 'package:user_accident/presentation/screens/owner_screens/forgot_password_email_screen.dart';
import 'package:user_accident/presentation/screens/owner_screens/on_boarding.dart';
import 'package:user_accident/presentation/screens/owner_screens/reset_password_emal_screen.dart';
import 'package:user_accident/presentation/screens/owner_screens/reset_password_phone_screen.dart';
import 'package:user_accident/presentation/screens/owner_screens/selecting_method_screen.dart';
import 'package:user_accident/presentation/screens/owner_screens/sign_in_screen.dart';
import 'package:user_accident/presentation/screens/owner_screens/splash_screen.dart';
import 'package:user_accident/presentation/widgets/home.dart';

class AppRouter {
  Route? generationRoute(RouteSettings settings) {  
    
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(builder: (context) => const SplashScreen());

      case selectingMethodScreen:
        return MaterialPageRoute(
            builder: (context) => const SelectingMethodScreen());

      case onBoardingScreen:
      final isOwner = settings.arguments;
        return MaterialPageRoute(
            builder: (context) => OnBoardingScreen(isOwner: isOwner,));

         
      case signInScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (BuildContext context) => LoginCubit(
                      AuthRepository(apiConsumer: DioConsumer(dio: Dio()))),
                  child: const SignInScreen(),
                ));

      case emergencySignInScreen:
        return MaterialPageRoute(builder: (context) => const EmergencySignInScreen());

      case forgotPasswordEmailScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (BuildContext context) => ForgotPasswordCubit(
                      AuthRepository(apiConsumer: DioConsumer(dio: Dio()))),
                  child: const ForgotPasswordEmailScreen(),
                ));

      case forgotPasswordPhoneScreen:
        return MaterialPageRoute(
            builder: (_) => const ForgotPasswordPhoneScreen());

      case resetPasswordEmailScreen:
        final email = settings.arguments;
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (BuildContext context) => ForgotPasswordCubit(
                      AuthRepository(apiConsumer: DioConsumer(dio: Dio()))),
                  child: ResetPasswordEmailScreen(
                    email: email,
                  ),
                ));

      case resetPasswordPhoneScreen:
        return MaterialPageRoute(
            builder: (_) => const ResetPasswordPhoneScreen());

      case changePasswordScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (BuildContext context) => ForgotPasswordCubit(
                      AuthRepository(apiConsumer: DioConsumer(dio: Dio()))),
                  child: const ChangePassword(),
                ));

      case homeScreen:
        
        return MaterialPageRoute(
            builder: (_) =>   HomePage());
    }
  }
}
