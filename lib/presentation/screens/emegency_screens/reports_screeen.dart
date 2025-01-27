// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:user_accident/constants/app_style.dart';
import 'package:user_accident/presentation/widgets/report_accident_places.dart';
import 'package:user_accident/presentation/widgets/reports_charts_emergency.dart';
import 'package:user_accident/presentation/widgets/reports_header_emergency.dart';

class ReportsScreeen extends StatefulWidget {
  const ReportsScreeen({super.key});

  @override
  State<ReportsScreeen> createState() => _ReportsScreeenState();
}

class _ReportsScreeenState extends State<ReportsScreeen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        toolbarHeight: MediaQuery.sizeOf(context).height / 8,
        title: Text(
          'Report',
          style: AppStyle.styleBold25(context).copyWith(color: Colors.black),
        ),
        centerTitle: true,
      ),
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
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  const ReportsHeaderEmergency(),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                      decoration: ShapeDecoration(
                          color: Colors.white,
                          shadows: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              offset: const Offset(0, 4),
                              blurRadius: 4.0,
                            ),
                          ],
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15))),
                      child: const LineChartWidget()),

                      const SizedBox(height: 15,),

                      const ReportAccidentPlacesAndNumberOfAccident()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

 