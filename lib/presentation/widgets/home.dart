import 'dart:developer';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:user_accident/presentation/widgets/local_notfy.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  late GoogleMapController _mapController;

  LatLng _markerPosition = const LatLng(0, 0);  // Default position (0, 0)

  // Define GlobalKey to access the state of HomePage
  static final GlobalKey<HomePageState> _homePageKey = GlobalKey<HomePageState>();

  static Future init() async {
    await messaging.requestPermission();
    await messaging.getToken().then((value) {
      // Save the token if needed
    });
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
    // Extract latitude and longitude from message data
  }

  static void handleForegroundMessage() {
    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) {
        // Extract latitude and longitude from the message data
        double lat = message.data['lat'] ?? 0.0;
        double lng = message.data['lng'] ?? 0.0;

        // Show local notification
        LocalNotificationService.showBasicNotification(message);

        // Use the global key to access the HomePageState and update the marker position
        if (_homePageKey.currentState != null) {
          _homePageKey.currentState?.updateMarkerPosition(LatLng(lat, lng));
        }
      },
    );
  }

  void updateMarkerPosition(LatLng newPosition) {
    setState(() {
      _markerPosition = newPosition;
    });
    // Move the camera to the new marker position
    _mapController.animateCamera(
      CameraUpdate.newLatLng(_markerPosition),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Notifications Example")),
      body:
      
          GoogleMap(
            mapType: MapType.normal,
              myLocationEnabled: true,
              myLocationButtonEnabled: false,
              zoomControlsEnabled: false,
            initialCameraPosition: CameraPosition(
              target: _markerPosition,
              zoom: 14.0,
            ),
            onMapCreated: (GoogleMapController controller) {
              _mapController = controller;
            },
            markers: {
              Marker(
                markerId: const MarkerId('notification_marker'),
                position: _markerPosition,
                infoWindow: const InfoWindow(title: 'Notification Location'),
              ),
            },
          ),
           
        
    );
  }
}
