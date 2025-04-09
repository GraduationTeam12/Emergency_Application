// ignore_for_file: deprecated_member_use, library_prefixes, avoid_print

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:user_accident/constants/app_style.dart';
import 'package:user_accident/core/api/end_points.dart';
import 'package:user_accident/core/cache/cache_helper.dart';
import 'package:user_accident/presentation/widgets/notifications_body.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  late IO.Socket socket;
  List<dynamic> notifications = [];
  String token = CacheHelper().getData(key: ApiKeys.token);
  final String notificationsKey = 'cached_notifications';

  @override
  void initState() {
    super.initState();

    _loadCachedNotifications();
    _connectToSocket();
  }

  Future<void> _loadCachedNotifications() async {
    var cachedData = CacheHelper().getData(key: notificationsKey);
    if (cachedData != null) {
      setState(() {
        notifications = jsonDecode(cachedData);
      });
    }
  }

  Future<void> _saveNotificationsToCache(List<dynamic> data) async {
    await CacheHelper().saveData(
      key: notificationsKey,
      value: jsonEncode(data),
    );
  }

  void _connectToSocket() {
    socket = IO.io(
      'https://satars.onrender.com/emergency',
      IO.OptionBuilder()
          .setTransports(['websocket'])
          .setExtraHeaders({'Authorization': 'Bearer $token'})
          .disableAutoConnect()
          .build(),
    );

    socket.onConnect((_) {
      print('Connected to server');
      print(token);
    });

    socket.on('loadNotifications', (data) async {
      print('Data received: $data');

      var newNotifications = jsonDecode(jsonEncode(data));

      if (!_areNotificationsEqual(notifications, newNotifications)) {
        setState(() {
          notifications = newNotifications;
        });

        await _saveNotificationsToCache(notifications);
      }
    });

    socket.onDisconnect((_) {
      print('Disconnected from server');
    });

    socket.connect();
  }

  bool _areNotificationsEqual(
      List<dynamic> old, List<dynamic> newNotifications) {
    if (old.length != newNotifications.length) return false;
    for (int i = 0; i < old.length; i++) {
      if (old[i]['id'] != newNotifications[i]['id']) return false;
    }
    return true;
  }

  @override
  void dispose() {
    socket.disconnect();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        toolbarHeight: MediaQuery.sizeOf(context).height / 8,
        title: Text(
          'الاشعارات',
          style: AppStyle.styleBold25(context).copyWith(color: Colors.black),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 2,
              decoration: BoxDecoration(
                color: Colors.grey[400],
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
            ),
            notifications.isEmpty
                ? const Text('')
                : NotificationsBody(notifications: notifications)
          ],
        ),
      ),
    );
  }
}
