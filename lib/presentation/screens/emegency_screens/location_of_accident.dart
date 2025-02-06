import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:user_accident/constants/colors.dart';
import 'package:user_accident/core/helper/location_helper.dart';

class LocationOfAccident extends StatefulWidget {
  const LocationOfAccident(
      {super.key,
      required this.latOfAccidentLocation,
      required this.longOfAccidentLocation});

  final double latOfAccidentLocation;
  final double longOfAccidentLocation;
  @override
  State<LocationOfAccident> createState() => _LocationOfAccidentState();
}

class _LocationOfAccidentState extends State<LocationOfAccident> {
  GoogleMapController? mapController;
  late Marker accidentLocationMarker;
  late Marker hospitalLocationMarker;
  late CameraPosition goToAccidentLocation;
  final Completer<GoogleMapController> _mapController = Completer();
  Set<Marker> markers = {};
  List<LatLng> polylineCoordinates = [];
  static Position? position;
  StreamSubscription<Position>? positionStreamSubscription;

  void buildCameraNewPosition() {
    goToAccidentLocation = CameraPosition(
      bearing: 0.0,
      tilt: 0.0,
      target: LatLng(
        widget.latOfAccidentLocation,
        widget.longOfAccidentLocation,
      ),
      zoom: 15,
    );
  }

  static final CameraPosition _myCurrentLocationCameraPosition = CameraPosition(
    bearing: 0.0,
    target: LatLng(position!.latitude, position!.longitude
        // CacheHelper().getData(key: 'lat'), CacheHelper().getData(key: 'lng')
        ),
    tilt: 0.0,
    zoom: 17,
  );
  // Position? _lastDirectionsUpdatePosition;
  // static const double _updateDistance = 1.0;

  void _trackLocationChanges() async {
    position = await LocationHelper.getCurrentLocation();

    _getDirections();
    // _lastDirectionsUpdatePosition = position;
    positionStreamSubscription = Geolocator.getPositionStream(
        locationSettings: const LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 2,
    )).listen(
      (Position newPosition) async {
        position = newPosition;

        final GoogleMapController controller = await _mapController.future;
        controller.animateCamera(CameraUpdate.newLatLng(
            LatLng(position!.latitude, position!.longitude)));

        // double distance = _lastDirectionsUpdatePosition != null
        //     ? Geolocator.distanceBetween(
        //         _lastDirectionsUpdatePosition!.latitude,
        //         _lastDirectionsUpdatePosition!.longitude,
        //         newPosition.latitude,
        //         newPosition.longitude,
        //       )
        //     : double.infinity;

        // if (distance >= _updateDistance) {
        //   _getDirections();

        //   _lastDirectionsUpdatePosition = newPosition;
        //   log('Updating directions after moving $_updateDistance meters');
        // }

        await _getDirections();

        log('Updating directions after moving meters');

        setState(() {});
      },
    );
  }

  Future<void> getMyCurrentLocation() async {
    position = await LocationHelper.getCurrentLocation().whenComplete(() {
      if (mounted) {
        setState(() {});
      }
    });
  }

  Future<void> _getDirections() async {
    polylineCoordinates.clear();
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleApiKey: "AIzaSyBW3ndkvcWC4zrdYMnOe4o7vMZb279fJNo",
      request: PolylineRequest(
        origin: PointLatLng(position!.latitude, position!.longitude),
        destination: PointLatLng(
            widget.latOfAccidentLocation, widget.longOfAccidentLocation),
        mode: TravelMode.driving,
      ),
    );

    if (result.points.isNotEmpty) {
      setState(() {
        polylineCoordinates = result.points
            .map((point) => LatLng(point.latitude, point.longitude))
            .toList();
      });
    }
  }

  void buildAccidentLocationMarker() {
    accidentLocationMarker = Marker(
      position: goToAccidentLocation.target,
      markerId: const MarkerId('1'),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    );

    addMarkerToMarkersAndUpdateUI(accidentLocationMarker);
  }

  void addMarkerToMarkersAndUpdateUI(Marker marker) {
    setState(() {
      markers.add(marker);
    });
  }

  void removeAllMarkersAndUpdateUI() {
    setState(() {
      markers.clear();
    });
  }

  Future<void> _goToMyCurrentLocation() async {
    final GoogleMapController controller = await _mapController.future;
    controller.animateCamera(
        CameraUpdate.newCameraPosition(_myCurrentLocationCameraPosition));
  }

  @override
  void initState() {
    super.initState();
    _trackLocationChanges();
    // _trackLocationChanges();
    buildCameraNewPosition();
    // buildCurrentLocationMarker();
    buildAccidentLocationMarker();
  }

  @override
  void dispose() {
    positionStreamSubscription?.cancel();
    mapController?.dispose();
    mapController = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          position != null
              ? GoogleMap(
                  onMapCreated: (GoogleMapController controller) {
                    _mapController.complete(controller);
                  },
                  initialCameraPosition: goToAccidentLocation,
                  mapType: MapType.terrain,
                  myLocationEnabled: true,
                  zoomControlsEnabled: false,
                  myLocationButtonEnabled: false,
                  markers: markers,
                  polylines: {
                    Polyline(
                      polylineId: const PolylineId("route"),
                      points: polylineCoordinates,
                      color: Colors.blue,
                      width: 5,
                    ),
                  },
                )
              : const Center(
                  child: CircularProgressIndicator(
                    color: MyColors.premiumColor,
                  ),
                ),
        ],
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.fromLTRB(0, 0, 8, 30),
        child: FloatingActionButton(
          backgroundColor: MyColors.premiumColor,
          onPressed: _goToMyCurrentLocation,
          child: Icon(
            Icons.place,
            color: Colors.white,
            size: MediaQuery.sizeOf(context).width > 600 ? 40 : null,
          ),
        ),
      ),
    );
  }
}
