// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:user_accident/constants/app_style.dart';
import 'package:user_accident/constants/colors.dart';
 

class LineChartWidget extends StatelessWidget {
  const LineChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('JAN', 80, 100),
      ChartData('FEB', 50, 60),
      ChartData('MAR', 40, 45),
      ChartData('APR', 70, 80),
      ChartData('MAY', 90, 120),
      ChartData('JUN', 40, 60),
      ChartData('JULY', 40, 60),
      ChartData('AUG', 40, 60),
      ChartData('SEPT', 40, 60),
      ChartData('OCT', 40, 60),
      ChartData('NOV', 40, 60),
      ChartData('DEC', 40, 60),
    ];

    return SizedBox(
      height: 300,
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: SfCartesianChart(
          primaryXAxis:   CategoryAxis(
            majorGridLines: const MajorGridLines(width: 0),
            labelStyle: AppStyle.styleRegular16(context).copyWith(
              color: const Color(0xff68737d),
            )
          ),
          primaryYAxis: NumericAxis(
            minimum: 0,
            maximum: 150,
            interval: 25,
            majorGridLines: MajorGridLines(
              width: 1,
              color: Colors.grey.withOpacity(0.3),
            ),
            labelStyle: AppStyle.styleRegular16(context).copyWith(
              color: const Color(0xff68737d),
            )
          ),
          
          series: <CartesianSeries>[
             
            LineSeries<ChartData, String>(
              dataSource: chartData,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y1,
              color: MyColors.premiumColor,
              width: 2,
              markerSettings:   const MarkerSettings(
                isVisible: false,
                // height: 5,
                // width: 5,
                // borderWidth: 2,
                // borderColor: MyColors.premiumColor,
              ),
            ),
           
            LineSeries<ChartData, String>(
              dataSource: chartData,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y2,
              color: Colors.amber,
              width: 2,
              markerSettings: const MarkerSettings(
                isVisible: false,
                // height: 8,
                // width: 8,
                // borderWidth: 2,
                // borderColor: Colors.white,
              ),
            ),
          ],
          plotAreaBorderWidth: 0,
          plotAreaBorderColor: const Color(0xff37434d),
           
          enableAxisAnimation: true,
          crosshairBehavior: CrosshairBehavior(enable: true),
          zoomPanBehavior: ZoomPanBehavior(
            enablePinching: true,
            enablePanning: true,
            enableDoubleTapZooming: true,
          ),
        ),
      ),
    );
  }
}

 
class ChartData {
  ChartData(this.x, this.y1, this.y2);
  final String x;
  final double y1;
  final double y2;
}