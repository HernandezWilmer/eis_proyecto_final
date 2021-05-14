import 'package:flutter/foundation.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class UsoSeries {
  final String uso;
  final int cantidad;
  //final etiqueta;

  final charts.Color barColor;

  UsoSeries(
      {@required this.uso,
      @required this.cantidad,
      //this.etiqueta,
      @required this.barColor});
}
