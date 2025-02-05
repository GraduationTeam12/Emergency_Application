// ignore_for_file: avoid_print

import 'package:firebase_messaging/firebase_messaging.dart';

// late FlutterLocalNotificationsPlugin _localNotifications;
class PushNotificationsService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token;  

  static Future init() async {
     
    await messaging.requestPermission();


    token = await messaging.getToken();

    if (token != null) {
      print('FCM Token: $token');
    } else {
      print('Failed to get FCM Token');
    }


    
  }
}