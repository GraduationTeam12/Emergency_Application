import 'dart:developer';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:user_accident/main.dart';
import 'package:user_accident/presentation/screens/emegency_screens/notifications_screen.dart';
import 'package:user_accident/presentation/widgets/local_notification.dart';

class ReceivingNotifications {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;

  static Future init() async {
    // Request permission first
    // await _requestPermission();

    // Initialize Firebase Messaging
    await Firebase.initializeApp();

    messaging.onTokenRefresh.listen((value) {
      // Handle token refresh
    });

    // Set up message handlers
    FirebaseMessaging.onBackgroundMessage(handlebackgroundMessage);
    handleForegroundMessage();
    setupInteractedMessage();

    messaging.subscribeToTopic('all').then((val) {
      log('Subscribed to topic');
    });
  }

  // static Future<void> _requestPermission() async {
  //   NotificationSettings settings = await messaging.requestPermission(
  //     alert: true,
  //     badge: true,
  //     sound: true,
  //     provisional: false,
  //   );
    
  //   log('User granted permission: ${settings.authorizationStatus}');
  // }

  static Future<void> handlebackgroundMessage(RemoteMessage message) async {
    await Firebase.initializeApp();
    log('Handling background message: ${message.messageId}');
    log('Notification Title: ${message.notification?.title}');
    log('Notification Body: ${message.notification?.body}');
  }

  static void handleForegroundMessage() {
    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) {
        log('Got a message whilst in the foreground!');
        log('Message data: ${message.data}');

        LocalNotificationService.showBasicNotification(
          message,
          onNotificationClick: (String? payload) {
            navigateToNotificationScreen();
          },
        );
      },
    );
  }

  static Future<void> setupInteractedMessage() async {
    // Get any messages which caused the application to open from terminated state
    RemoteMessage? initialMessage = await messaging.getInitialMessage();
    
    if (initialMessage != null) {
      log('Initial Message received');
      _handleMessage(initialMessage);
    }

    // Also handle any interaction when the app is in the background via a Stream listener
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
  }

  static void _handleMessage(RemoteMessage message) {
    log('Handling message: ${message.messageId}');
    
    if (message.data['type'] == 'notification' || message.notification != null) {
      Future.delayed(const Duration(milliseconds: 1000), () {
        navigateToNotificationScreen();
      });
    }
  }

  static void navigateToNotificationScreen() {
    log('Navigating to notification screen');
      navigatorKey.currentState?.push(
      MaterialPageRoute(
        builder: (_) => const NotificationsScreen(),
      ),
    );
  }
}