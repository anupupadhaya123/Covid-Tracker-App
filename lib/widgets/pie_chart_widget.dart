import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pie_chart/pie_chart.dart';

import '../Utilities/constant.dart';
import '../users_list/Model/world_states.dart';

 // ignore: non_constant_identifier_names
 PieChart PieChartWidget(AsyncSnapshot<WorldStatesModel> snapshot) {
    return PieChart(
      dataMap: {
        "Total": double.parse(snapshot.data!.cases!.toString()),
        "Recovered": double.parse(snapshot.data!.recovered.toString()),
        "Deaths": double.parse(snapshot.data!.deaths.toString()),
      },
      animationDuration: const Duration(milliseconds: 1200),
      chartLegendSpacing: 32,
      chartRadius: 100.w,
      colorList: colorList,
      initialAngleInDegree: 0,
      chartType: ChartType.ring,
      ringStrokeWidth: 25.w,
      legendOptions: const LegendOptions(
        showLegendsInRow: false,
        legendPosition: LegendPosition.left,
        showLegends: true,
        legendTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      chartValuesOptions: const ChartValuesOptions(
        showChartValueBackground: true,
        showChartValues: true,
        showChartValuesInPercentage: true,
        showChartValuesOutside: true,
        decimalPlaces: 1,
      ),
    );
  }

