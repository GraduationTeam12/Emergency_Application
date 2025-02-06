import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:user_accident/constants/pages_name.dart';
import 'package:user_accident/core/api/end_points.dart';
import 'package:user_accident/core/cache/cache_helper.dart';
import 'package:user_accident/firebase_options.dart';
import 'package:user_accident/presentation/widgets/get_fcm_token.dart';
import 'package:user_accident/presentation/widgets/local_notification.dart';
import 'package:user_accident/presentation/widgets/receiving_notifications.dart';
import 'package:user_accident/routing.dart';

final navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  CacheHelper().init();
  // The application works in portrait orientation only
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await Future.wait([
    PushNotificationsService.init(),
    ReceivingNotifications.init(),
    LocalNotificationService.init()
  ]);
  runApp(DevicePreview(
    enabled: true,
    builder: (context)=> EasyLocalization(
      supportedLocales: const [Locale('ar'),],
      fallbackLocale: const Locale('ar'),
      startLocale: const Locale('ar'),
        path:
            'assets/translations',
      child: MyApp(
        appRouter: AppRouter(),
      ),
    ),
  ));
}

class MyApp extends StatelessWidget {
    MyApp({super.key, required this.appRouter});

  final AppRouter appRouter;
  final token = CacheHelper().getData(key: ApiKeys.token);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: const Locale('ar'),
      title: 'SATARS',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: appRouter.generationRoute,
      initialRoute: token == null ? splashScreen : homeEmergencyScreen,
      // initialRoute:  emergencySignInScreen,
    );
  }
}