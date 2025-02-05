import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:user_accident/presentation/widgets/local_notification.dart';

class ReceivingNotifications {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;

  static Future init() async {
    // await messaging.getToken().then((value) {
    //   // Save the token if needed
    // });
    messaging.onTokenRefresh.listen((value) {
      // Handle token refresh
    });
    FirebaseMessaging.onBackgroundMessage(handlebackgroundMessage);

    // Handle foreground messages
    handleForegroundMessage();
    messaging.subscribeToTopic('all').then((val) {
      log('Subscribed to topic');
    });
  }

  static Future<void> handlebackgroundMessage(RemoteMessage message) async {
    await Firebase.initializeApp();
    log(message.notification?.title ?? 'null');
  }

  static void handleForegroundMessage() {
    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) {
        LocalNotificationService.showBasicNotification(message);
      },
    );
  }
}