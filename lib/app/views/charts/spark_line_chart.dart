import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

import '../../data/resources/color_resources.dart';

class SparkLine extends StatelessWidget {
  final Color backgroundColor;
  const SparkLine(Key? key, this.backgroundColor) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      child: Card(
        color: backgroundColor,
        child: SfSparkLineChart(
          // Initialize category axis
          axisLineColor: TRANSPARENT,
          labelDisplayMode: SparkChartLabelDisplayMode.all,
          data: [16, 44, 34, 76, 98],
          marker:
              SparkChartMarker(displayMode: SparkChartMarkerDisplayMode.all),
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
