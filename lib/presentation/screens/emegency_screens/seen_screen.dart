
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:user_accident/constants/app_style.dart';
import 'package:user_accident/constants/colors.dart';
import 'package:user_accident/core/api/end_points.dart';
import 'package:user_accident/core/cache/cache_helper.dart';
import 'package:user_accident/presentation/widgets/notifications_body.dart';

class SeenScreen extends StatefulWidget {
  const SeenScreen({super.key});

  @override
  State<SeenScreen> createState() => _SeenScreenState();
}

class _SeenScreenState extends State<SeenScreen> {late IO.Socket socket;
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
      appBar:  PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.sizeOf(context).height / 10),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(blurRadius: 4,offset: Offset(0, 4),spreadRadius: 0,color: Colors.black26)
            ],
            color: MyColors.premiumColor,
             borderRadius: BorderRadius.only( bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30),)
          ),
          child: AppBar(
            elevation: 0,
            scrolledUnderElevation: 0,
            backgroundColor: Colors.transparent,
            toolbarHeight: MediaQuery.sizeOf(context).height / 10,
            title: Text(
              'تمت المتابعة',
              style: AppStyle.styleBold25(context).copyWith(color: Colors.white),
            ),
            centerTitle: true,
            leading: IconButton(
              icon:  Icon(Icons.arrow_back_ios_new_outlined,color: Colors.white,
                size: MediaQuery.sizeOf(context).width > 600
                                    ? 40
                                    : null,),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            
            notifications.isEmpty
                ? const Text('')
                : NotificationsBody(notifications: notifications)
          ],
        ),
      ),
    );
  }
}
