// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:user_accident/constants/app_style.dart';

class Places extends StatelessWidget {
  const Places({super.key, required this.locations});
  final List<MapEntry<String, int>> locations;

  TopAccidentLocations(locations) {
    // TODO: implement TopAccidentLocations
    throw UnimplementedError();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          scrolledUnderElevation: 0,
          title: Text(
            "Places",
            style: AppStyle.styleBold25(context).copyWith(color: Colors.black),
          ),
          toolbarHeight: MediaQuery.sizeOf(context).height / 8,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                size: MediaQuery.sizeOf(context).width > 600 ? 50 : null,
              )),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Container(
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
          width: MediaQuery.sizeOf(context).width,
          child: ListView.builder(
              itemCount: locations.length,
              itemBuilder: (context, index) {
                final location = locations[index];
                return Container(
                  height: 150,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.25),
                      offset: const Offset(0, 4),
                      blurRadius: 4.0,
                    ),
                  ], borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: Container(
                            height: 150,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(5),
                                    topLeft: Radius.circular(5)),
                                image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/auth_images/place.jpeg"),
                                    fit: BoxFit.cover)),
                          )),
                      Expanded(
                          flex: 4,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5, vertical: 5),
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(5),
                                    bottomRight: Radius.circular(5))),
                            child: Column(
                              children: [
                                const Spacer(
                                  flex: 1,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Icon(
                                      Icons.location_on_outlined,
                                      size: 22,
                                      color: Color.fromRGBO(211, 33, 33, 1),
                                    ),
                                    Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.5,
                                        padding: const EdgeInsets.only(left: 5),
                                        child: Text(
                                          "${location.key}",
                                          style: const TextStyle(
                                              color:
                                                  Color.fromRGBO(38, 50, 56, 1),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14),
                                        ))
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.5,
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(
                                      "Accidents: ${location.value}",
                                      style: const TextStyle(
                                          color: Color.fromRGBO(38, 50, 56, 1),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14),
                                    )),
                                const Spacer(
                                  flex: 5,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                            bottom: 10, right: 10),
                                        padding: const EdgeInsets.only(
                                            left: 18,
                                            right: 18,
                                            bottom: 4,
                                            top: 4),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: const Color.fromRGBO(
                                              61, 100, 152, 1),
                                        ),
                                        child: const Text(
                                          "View",
                                          style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )),
                    ],
                  ),
                );
              }),
        ));
  }
}
