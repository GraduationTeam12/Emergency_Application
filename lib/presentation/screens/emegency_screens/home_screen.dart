import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:user_accident/constants/colors.dart';
import 'package:user_accident/constants/pages_name.dart';
import 'package:user_accident/core/helper/location_helper.dart';
import 'package:user_accident/presentation/screens/emegency_screens/bottom_sheet.dart';

class HomeScreenEmergency extends StatefulWidget {
  const HomeScreenEmergency({super.key});

  @override
  State<HomeScreenEmergency> createState() => _HomeScreenEmergencyState();
}

class _HomeScreenEmergencyState extends State<HomeScreenEmergency> {
  GoogleMapController? mapController;
  static Position? position;

  // static const LatLng _center = LatLng(30.0444, 31.2357);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  static final CameraPosition _myCurrentLocationCameraPosition = CameraPosition(
    bearing: 0.0,
    target: LatLng(position!.latitude, position!.longitude),
    tilt: 0.0,
    zoom: 17,
  );

  @override
  initState() {
    super.initState();
    getMyCurrentLocation();
  }

  Future<void> getMyCurrentLocation() async {
    position = await LocationHelper.getCurrentLocation().whenComplete(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(fit: StackFit.expand, children: [
        position != null
            ? GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: _myCurrentLocationCameraPosition,
                mapType: MapType.normal,
                myLocationEnabled: true,
                zoomControlsEnabled: false,
                myLocationButtonEnabled: false,
              )
            : const Center(
                child: CircularProgressIndicator(
                  color: MyColors.premiumColor,
                ),
              ),
        Positioned(
          top: 16,
          left: 16,
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
