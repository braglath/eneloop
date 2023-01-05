import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Pyramid extends StatelessWidget {
  final Color backgroundColor;
  const Pyramid(
    Key? key,
    this.backgroundColor,
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      child: Card(
          color: backgroundColor,
          child: Center(
              child: SfPyramidChart(
                  // legend: Legend(isVisible: true),
                  // title: ChartTitle(text: 'Community  Sales'),
                  series: PyramidSeries<PyramidData, String>(
            dataSource: <PyramidData>[
              PyramidData('Jan', 35),
              PyramidData('Feb', 28),
              PyramidData('Mar', 34),
              PyramidData('Apr', 32),
              PyramidData('May', 40)
            ],
            xValueMapper: (PyramidData sales, _) => sales.year,
            yValueMapper: (PyramidData sales, _) => sales.sales,
            dataLabelSettings: const DataLabelSettings(isVisible: true),
          )))),
    );
  }
}

class PyramidData {
  PyramidData(this.year, this.sales);
  final String year;
  final double sales;
}
