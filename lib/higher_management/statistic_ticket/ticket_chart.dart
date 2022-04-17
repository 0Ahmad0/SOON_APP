import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
class TicketChart {
  final String numX;
  final int numY;
  final charts.Color barColor;

  TicketChart({
   required this.numX,
   required this.numY,
   required this.barColor

});
}

//****************
class TicketChartWidget extends StatelessWidget {
  final List<TicketChart> data;
  TicketChartWidget({required this.data});
  @override
  Widget build(BuildContext context) {
    List<charts.Series<TicketChart, String>> series = [
      charts.Series(
          id: "Soon",
          data: data,
          domainFn: (TicketChart series, _) => series.numX,
          measureFn: (TicketChart series, _) => int.parse(series.numX),
          colorFn: (TicketChart series, _) => series.barColor
      )
    ];
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: charts.BarChart(
                series,
                animate: true,
              ),
            )
          ],
        ),
      ),
    );
  }
}
