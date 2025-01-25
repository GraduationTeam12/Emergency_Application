import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:user_accident/constants/pages_name.dart';
import 'package:user_accident/core/api/end_points.dart';
import 'package:user_accident/core/cache/cache_helper.dart';
import 'package:user_accident/firebase_options.dart';
import 'package:user_accident/presentation/widgets/home.dart';
import 'package:user_accident/presentation/widgets/test.dart';
import 'package:user_accident/routing.dart';

 
Future<void> main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
 

  CacheHelper().init();
  // The application works in portrait orientation only
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await Future.wait([
    PushNotificationsService.init(),
    HomePageState.init()
  ]);
 
  runApp(DevicePreview(
    enabled: false,
    builder: (context)=> MyApp(
      appRouter: AppRouter(),
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
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: appRouter.generationRoute,
      initialRoute: splashScreen,
    );
  }
}