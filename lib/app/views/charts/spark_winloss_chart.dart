import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class SparkWinLoss extends StatelessWidget {
  final Color backgroundColor;
  const SparkWinLoss(
    Key? key,
    this.backgroundColor,
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      child: Card(
        color: backgroundColor,
        child: SfSparkWinLossChart(
          // Initialize category axis
          // axisLineColor:TRANSPARENT,
          // plotBand: SparkChartPlotBand(borderColor: Colors.white),
          data: const [16, 98],

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
