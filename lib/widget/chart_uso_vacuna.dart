import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:vacunas/models/subscriber_series_uso.dart';

class SubscriberChartUso extends StatelessWidget {
  final List<UsoSeries> data;
  final String departamento;

  SubscriberChartUso({@required this.data, this.departamento});

  @override
  Widget build(BuildContext context) {
    List<charts.Series<UsoSeries, String>> series = [
      charts.Series(
          id: "Uso",
          data: data,
          domainFn: (UsoSeries series, _) => series.uso,
          measureFn: (UsoSeries series, _) => series.cantidad,
          colorFn: (UsoSeries series, _) => series.barColor)
    ];

    return Container(
      height: 400,
      padding: EdgeInsets.all(20),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Text(
                "Vacunas asignadas según su uso en $departamento",
                style: TextStyle(
                    color: Colors.redAccent, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: charts.BarChart(series, animate: true),
              )
            ],
          ),
        ),
      ),
    );
  }
}
