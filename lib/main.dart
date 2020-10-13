import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  return runApp(_ChartApp());
}

class _ChartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Chart Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: _MyHomePage(),
    );
  }
}

class _MyHomePage extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  _MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Syncfusion Flutter chart'),
        ),
        body: SfCartesianChart(
            primaryXAxis: CategoryAxis(),
            // Chart title
            title: ChartTitle(text: 'Half yearly sales analysis'),
            // Enable legend
            legend: Legend(isVisible: true),
            // Enable tooltip
            tooltipBehavior: TooltipBehavior(enable: true),
            enableAxisAnimation: true,

            series: <ChartSeries<_SalesData, String>>[
              SplineAreaSeries<_SalesData, String>(
                  dataSource: <_SalesData>[
                    _SalesData('Jan', 35),
                    _SalesData('Feb', 28),
                    _SalesData('Mar', 34),
                    _SalesData('Apr', 32),
                    _SalesData('May', 40),
                    _SalesData('Jun', 35),
                    _SalesData('Ful', 28),
                    _SalesData('Aug', 34),
                    _SalesData('sep', 32),
                    _SalesData('Oct', 40)
                  ],
                  xValueMapper: (_SalesData sales, _) => sales.year,
                  yValueMapper: (_SalesData sales, _) => sales.sales,
                  // Enable data label
                  dataLabelSettings: DataLabelSettings(isVisible: true))
            ]));
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}