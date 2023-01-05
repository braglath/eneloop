import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Pie extends StatelessWidget {
  final Color backgroundColor;
  final bool needTitle;
  final List<Color> colors;
  const Pie(Key? key, this.backgroundColor,
      {this.needTitle = false,
      this.colors = const <Color>[
        Color.fromRGBO(75, 135, 185, 1),
        Color.fromRGBO(192, 108, 132, 1),
        Color.fromRGBO(246, 114, 128, 1),
        Color.fromRGBO(248, 177, 149, 1),
        Color.fromRGBO(116, 180, 155, 1),
        Color.fromRGBO(0, 168, 181, 1),
        Color.fromRGBO(73, 76, 162, 1),
        Color.fromRGBO(255, 205, 96, 1),
        Color.fromRGBO(255, 240, 219, 1),
        Color.fromRGBO(238, 238, 238, 1)
      ]})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      child: Card(
          color: backgroundColor,
          child: Center(
              child: SfCircularChart(
                  // legend: Legend(isVisible: true),
                  palette: colors,
                  title:
                      needTitle ? ChartTitle(text: 'Community  Sales') : null,
                  series: <PieSeries<_PieData, String>>[
                PieSeries<_PieData, String>(
                    explode: true,
                    explodeIndex: 0,
                    dataSource: <_PieData>[
                      _PieData('1', 1, '40%'),
                      _PieData('2', 1, '30%'),
                      _PieData('3', 1, '50%'),
                    ],
                    xValueMapper: (_PieData data, _) => data.xData,
                    yValueMapper: (_PieData data, _) => data.yData,
                    dataLabelMapper: (_PieData data, _) => data.text,
                    dataLabelSettings: DataLabelSettings(isVisible: true)),
              ]))),
    );
  }
}

class _PieData {
  _PieData(this.xData, this.yData, this.text);
  final String xData;
  final num yData;
  final String text;
}
