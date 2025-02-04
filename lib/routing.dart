// ignore_for_file: body_might_complete_normally_nullable, empty_constructor_bodies

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_accident/constants/pages_name.dart';
import 'package:user_accident/core/api/dio_consumer.dart';
import 'package:user_accident/core/data/repo/auth_repo_emergency.dart';
import 'package:user_accident/core/logic/emergencies_features/emergencies_features_cubit.dart';
import 'package:user_accident/core/logic/login_emergency_cubit/login_emergency_cubit.dart';
import 'package:user_accident/core/logic/logout_cubit/logout_cubit.dart';
import 'package:user_accident/presentation/screens/emegency_screens/contact_with_admin.dart';
import 'package:user_accident/presentation/screens/emegency_screens/on_boarding_screen.dart';
import 'package:user_accident/presentation/screens/emegency_screens/places.dart';
import 'package:user_accident/presentation/screens/emegency_screens/profile_screen.dart';
import 'package:user_accident/presentation/screens/emegency_screens/emergency_sign_in_screen.dart';
import 'package:user_accident/presentation/screens/emegency_screens/home_screen.dart';
import 'package:user_accident/presentation/screens/emegency_screens/notifications_screen.dart';
import 'package:user_accident/presentation/screens/emegency_screens/reports_screeen.dart';
import 'package:user_accident/presentation/screens/emegency_screens/settings_screen.dart';
import 'package:user_accident/presentation/screens/emegency_screens/splash_screen.dart';
import 'package:user_accident/presentation/screens/emegency_screens/user_info.dart';
import 'package:user_accident/presentation/widgets/calendar.dart';

class AppRouter {
  Route? generationRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(builder: (context) => const SplashScreen());

      case onBoardingScreen:
        return MaterialPageRoute(
            builder: (context) => const OnBoardingScreen());

      case emergencySignInScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (BuildContext context) => LoginEmergencyCubit(
                      AuthRepoEmergency(apiConsumer: DioConsumer(dio: Dio()))),
                  child: const EmergencySignInScreen(),
                ));

      case homeEmergencyScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreenEmergency());

      case settingScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (BuildContext context) => LogoutCubit(),
                  child: const SettingsScreen(),
                ));

      case notificationsScreen:
        return MaterialPageRoute(builder: (_) => const NotificationsScreen());

      case reportsScreen:
        return MaterialPageRoute(builder: (_) => const ReportsScreeen());

      case userInfoScreen:
        return MaterialPageRoute(builder: (_) => const UserInfo());

      case emergencyProfileScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => EmergenciesFeaturesCubit(
                      AuthRepoEmergency(apiConsumer: DioConsumer(dio: Dio()))),
                  child: const EmergencyProfileScreen(),
                ));

      case contactWithAdminScreen:
        return MaterialPageRoute(builder: (_) => const ContactWithAdmin());

      case calendarScreen:
        return MaterialPageRoute(builder: (_) => const CalendarWidget());

      case placesScreen:
        return MaterialPageRoute(builder: (_) => const Places());
    }
  }
}
