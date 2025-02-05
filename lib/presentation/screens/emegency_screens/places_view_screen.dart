import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlacesViewScreen extends StatefulWidget {
  const PlacesViewScreen({super.key});

  @override
  State<PlacesViewScreen> createState() => _PlacesViewScreenState();
}

class _PlacesViewScreenState extends State<PlacesViewScreen> {
  GoogleMapController? mapController;

  // static const LatLng _center = LatLng(30.0444, 31.2357);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  static const CameraPosition _myCurrentLocationCameraPosition = CameraPosition(
    bearing: 0.0,
    target: LatLng(31.13580925794313, 33.809837393253),
    tilt: 0.0,
    zoom: 9,
  );

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: _myCurrentLocationCameraPosition,
            mapType: MapType.normal,
            myLocationEnabled: true,
            zoomControlsEnabled: false,
            myLocationButtonEnabled: false,
          ),
          Positioned(
            bottom: 0,
            top: MediaQuery.sizeOf(context).height -
                MediaQuery.sizeOf(context).height / 3.5,
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              padding: const EdgeInsets.all(15),
              height: MediaQuery.sizeOf(context).height / 5,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        size: 24,
                        color: Color.fromRGBO(211, 33, 33, 1),
                      ),
                      Container(
                        width: MediaQuery.sizeOf(context).width * 0.5,
                        padding: const EdgeInsets.only(left: 5),
                        child: const Text(
                          "الموقع",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 22,
                              fontFamily: "Roboto"),
                          //overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width * 0.5,
                    padding: const EdgeInsets.only(left: 25),
                    child: const Text(
                      "لعريش، شمال سيناء، مصر",
                      style: TextStyle(
                          color: Color.fromRGBO(38, 50, 56, 1),
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                          fontFamily: "Roboto"),
                      //overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 10,
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_forward)),
          )
        ],
      ),
    );
  }
}
