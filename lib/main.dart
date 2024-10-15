import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:user_accident/constants/pages_name.dart';
import 'package:user_accident/firebase_options.dart';
import 'package:user_accident/routing.dart';

 Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();
    // The application works in portrait orientation only
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
     );
    runApp( MyApp(appRouter: AppRouter(),));
 }

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.appRouter});

  final AppRouter appRouter;
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
