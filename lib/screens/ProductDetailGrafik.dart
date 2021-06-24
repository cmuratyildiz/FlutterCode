import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';


class ProductDetailGrafik extends StatefulWidget {


  @override
  State<StatefulWidget> createState() {
    return _ProductDetailGrafik();
  }
}

class _ProductDetailGrafik extends State {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ADMİN SAYFALARI !",style: GoogleFonts.davidLibre(),),
      ),
      body: BarChart(BarChartData(
          borderData: FlBorderData(
              border: Border(
                top: BorderSide.none,
                right: BorderSide.none,
                left: BorderSide(width: 1),
                bottom: BorderSide(width: 1),
              )),
          groupsSpace: 10,
          barGroups: [
            BarChartGroupData(x: 1, barRods: [
              BarChartRodData(y: 3, width: 15, colors: [Colors.amber]),
              BarChartRodData(y: 4.2, width: 15, colors: [Colors.red]),
              BarChartRodData(y: 5, width: 15, colors: [Colors.blue]),
            ]),
            BarChartGroupData(x: 2, barRods: [
              BarChartRodData(y: 8, width: 15, colors: [Colors.amber]),
              BarChartRodData(y: 6.2, width: 15, colors: [Colors.red]),
              BarChartRodData(y: 9, width: 15, colors: [Colors.blue]),
            ]),
            BarChartGroupData(x: 3, barRods: [
              BarChartRodData(y: 13, width: 15, colors: [Colors.amber]),
              BarChartRodData(y: 9.1, width: 15, colors: [Colors.red]),
              BarChartRodData(y: 5.3, width: 15, colors: [Colors.blue]),
            ]),
            BarChartGroupData(x: 4, barRods: [
              BarChartRodData(y: 15, width: 15, colors: [Colors.amber]),
              BarChartRodData(y: 11, width: 15, colors: [Colors.red]),
              BarChartRodData(y: 15, width: 15, colors: [Colors.blue]),
            ]),
            BarChartGroupData(x: 5, barRods: [
              BarChartRodData(y: 8, width: 15, colors: [Colors.amber]),
              BarChartRodData(y: 9.2, width: 15, colors: [Colors.red]),
              BarChartRodData(y: 15, width: 15, colors: [Colors.blue]),
            ]),
          ]))
      );

  }
}
