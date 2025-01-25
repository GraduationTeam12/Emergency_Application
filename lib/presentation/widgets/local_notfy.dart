import 'dart:async';
import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;

class LocalNotificationService {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static StreamController<NotificationResponse> streamController =
      StreamController();

  // Function called when the notification is tapped
  static onTap(NotificationResponse notificationResponse) {
    // log(notificationResponse.id!.toString());
    // log(notificationResponse.payload!.toString());
    streamController.add(notificationResponse);
    // Navigator.push(context, route);
  }

  // Initialization of local notifications
  static Future init() async {
    InitializationSettings settings = const InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'), // Default small icon
      iOS: DarwinInitializationSettings(),
    );
    flutterLocalNotificationsPlugin.initialize(
      settings,
      onDidReceiveNotificationResponse: onTap,
      onDidReceiveBackgroundNotificationResponse: onTap,
    );
  }

  // Basic Notification
  static void showBasicNotification(RemoteMessage message) async {
    // If you want to load an image for the notification (optional)
    // final http.Response image = await http
    //     .get(Uri.parse(message.notification?.android?.imageUrl ?? ''));
    // BigPictureStyleInformation bigPictureStyleInformation =
    //     BigPictureStyleInformation(
    //   largeIcon: ByteArrayAndroidBitmap.fromBase64String(
    //     base64Encode(image.bodyBytes),
    //   ),
    // );

    // Define Android notification details
    AndroidNotificationDetails android = const AndroidNotificationDetails(
      'channel_id', // Channel ID
      'channel_name', // Channel name
      importance: Importance.max, // High importance
      priority: Priority.high, // High priority
      playSound: true, // Play sound when notification arrives
      icon: '@mipmap/ic_launcher', // Small icon
      // sound: RawResourceAndroidNotificationSound(
      //     'long_notification_sound'.split('.').first), // Custom sound (if needed)
    );

    // Define notification details
    NotificationDetails details = NotificationDetails(
      android: android,
    );

    // Show the notification
    await flutterLocalNotificationsPlugin.show(
      0, // Notification ID
      message.notification?.title, // Notification title
      message.notification?.body, // Notification body
      details, // Notification details
    );
  }
}
