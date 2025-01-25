import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

late FlutterLocalNotificationsPlugin _localNotifications;
class PushNotificationsService {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static String? token; // متغير لتخزين التوكين

  static Future init() async {
    // طلب الإذن للإشعارات
    await messaging.requestPermission();

    // الحصول على التوكين
    token = await messaging.getToken();

    // طباعة التوكين
    if (token != null) {
      print('FCM Token: $token');
    } else {
      print('Failed to get FCM Token');
    }

    Future<void> _showNotification(String? title, String? body) async {
    const androidDetails = AndroidNotificationDetails(
      'channel_id', 'channel_name',
      importance: Importance.high,
      priority: Priority.high,
      icon: 'app_icon',
    );
    const notificationDetails = NotificationDetails(android: androidDetails);

    await _localNotifications.show(
      0,
      title,
      body,
      notificationDetails,
    );
  }


    // الاشتراك/إلغاء الاشتراك في الموضوع (اختياري)
    // messaging.unsubscribeFromTopic('all');
  }
}
