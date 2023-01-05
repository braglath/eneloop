import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

import '../../data/resources/color_resources.dart';

class SparkBar extends StatelessWidget {
  final Color backgroundColor;
  const SparkBar(
    Key? key,
    this.backgroundColor,
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      child: Card(
        color: backgroundColor,
        child: SfSparkBarChart(
          // Initialize category axis
          axisLineColor: TRANSPARENT,
          labelDisplayMode: SparkChartLabelDisplayMode.all,
          plotBand: SparkChartPlotBand(borderColor: Colors.white),
          data: const [16, 44, 34, 76, 98],

          // plotBand: SparkChartPlotBand(),
        ),
      ),
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final String year;
  final double sales;
}
