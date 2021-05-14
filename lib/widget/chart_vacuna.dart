import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:vacunas/models/subscriber_series.dart';

class SubscriberChart extends StatelessWidget {
  final List<LaboratioSeries> data;
  final String departamento;

  SubscriberChart({@required this.data, this.departamento});

  @override
  Widget build(BuildContext context) {
    List<charts.Series<LaboratioSeries, String>> series = [
      charts.Series(
          id: "Laboratorios",
          data: data,
          labelAccessorFn: (LaboratioSeries series, _) =>
              '${series.cantidad.toString()}',
          domainFn: (LaboratioSeries series, _) => series.laboratorio,
          measureFn: (LaboratioSeries series, _) => series.cantidad,
          colorFn: (LaboratioSeries series, _) => series.barColor)
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
                "Vacunas asignadas por laboratorio para $departamento",
                style: TextStyle(
                    color: Colors.redAccent, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: charts.BarChart(
                  series,
                  animate: true,
                  barRendererDecorator: new charts.BarLabelDecorator<String>(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
