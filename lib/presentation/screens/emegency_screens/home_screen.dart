 import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:user_accident/constants/pages_name.dart';
import 'package:user_accident/core/cache/cache_helper.dart';
import 'package:user_accident/presentation/screens/emegency_screens/bottom_sheet.dart';
import 'package:user_accident/presentation/widgets/sidebar_icons.dart';

class HomeScreenEmergency extends StatefulWidget {
  const HomeScreenEmergency({super.key});

  @override
  State<HomeScreenEmergency> createState() => HomeScreenEmergencyState();
}

class HomeScreenEmergencyState extends State<HomeScreenEmergency> {
  GoogleMapController? mapController;

  
String? userType;

@override
void initState() {
  super.initState();
  userType = CacheHelper().getData(key: 'userType');
}

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  static final CameraPosition _myCurrentLocationCameraPosition = CameraPosition(
    bearing: 0.0,
    target: LatLng(
        CacheHelper().getData(key: 'lat'), CacheHelper().getData(key: 'lng')),
    tilt: 0.0,
    zoom: 17,
  );

  

  @override
  void dispose() {
    mapController?.dispose();
    mapController = null;  
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(fit: StackFit.expand, children: [
        GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: _myCurrentLocationCameraPosition,
          mapType: MapType.terrain,
          myLocationEnabled: true,
          zoomControlsEnabled: false,
          myLocationButtonEnabled: false,
          markers: {
            Marker(
              markerId: const MarkerId('1'),
              position: LatLng( CacheHelper().getData(key: 'lat'), CacheHelper().getData(key: 'lng')), 
              onTap: () {},
              icon: BitmapDescriptor.defaultMarkerWithHue(
                  BitmapDescriptor.hueBlue),
            ),
          },
        ),
        Positioned(
          top: 16,
          right: 16,
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, notificationsScreen);
            },
            child: Container(
              padding: const EdgeInsets.all(8),
              height: MediaQuery.sizeOf(context).width > 600 ? 65 : 45,
              width: MediaQuery.sizeOf(context).width > 600 ? 65 : 45,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4.0,
                    spreadRadius: 1.0,
                    offset: Offset(0.0, 2.0),
                  ),
                ],
              ),
              child: SvgPicture.asset(
                'assets/images/auth_images/emergency_images/notification.svg',
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
         Positioned(
          bottom: 8,
          left: 4,
          child: SidebarIcons(userType: userType??""),)
        // const DraggableBottomSheet()
      ])),
    );
  }
}
