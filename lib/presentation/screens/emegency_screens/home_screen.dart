 import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:user_accident/constants/pages_name.dart';
import 'package:user_accident/core/cache/cache_helper.dart';
import 'package:user_accident/presentation/screens/emegency_screens/bottom_sheet.dart';

class HomeScreenEmergency extends StatefulWidget {
  const HomeScreenEmergency({super.key});

  @override
  State<HomeScreenEmergency> createState() => HomeScreenEmergencyState();
}

class HomeScreenEmergencyState extends State<HomeScreenEmergency> {
  GoogleMapController? mapController;
  

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
            child: SizedBox(
              height: MediaQuery.sizeOf(context).width > 600 ? 60 : 45,
              width: MediaQuery.sizeOf(context).width > 600 ? 60 : 45,
              child: SvgPicture.asset(
                'assets/images/auth_images/emergency_images/notification.svg',
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        const DraggableBottomSheet()
      ])),
    );
  }
}
