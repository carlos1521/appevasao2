import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:http/http.dart' as http;

const request = "http://apiuladech.grupodcv.com/est_cur1con.php?curso=1";

Future<Map> getData() async {
  http.Response response= await http.get(request);
  return json.decode(response.body);
}

class Mediasxcurso extends StatefulWidget {
  Mediasxcurso(this.i) : super();
  int i;
  final String title = "Charts Demo";

  @override
  _MediasxcursoState createState() => _MediasxcursoState();
}

class _MediasxcursoState extends State<Mediasxcurso> {

  //var url = "http://apiuladech.grupodcv.com/est_cur1con.php?curso=1";
  //final response = http.post( url );


  List<charts.Series> seriesList;
  static List<charts.Series<Sales, String>> _createRandomData() {
    //final random = Random();


    final desktopSalesData = [
      Sales('Total Créditos', 12.0),
      Sales('Total Periodos', 55.00),
      Sales('Nota EA', 9.40),
      Sales('Média', 49.09),
    ];

    final tabletSalesData = [
      Sales('Total Créditos', 40.06),
      Sales('Total Periodos', 36.80),
      Sales('Nota EA', 49.009),
      Sales('Média', 27.02),
    ];

    return [
      charts.Series<Sales, String>(
        id: 'Sales',
        domainFn: (Sales sales, _) => sales.year,
        measureFn: (Sales sales, _) => sales.sales,
        data: desktopSalesData,
        fillColorFn: (Sales sales, _) {
          return charts.MaterialPalette.blue.shadeDefault;
        },
      ),
      charts.Series<Sales, String>(
        id: 'Sales',
        domainFn: (Sales sales, _) => sales.year,
        measureFn: (Sales sales, _) => sales.sales,
        data: tabletSalesData,
        fillColorFn: (Sales sales, _) {
          return charts.MaterialPalette.red.shadeDefault;
        },
      )
    ];
  }


  barChart() {
    return charts.BarChart(
      seriesList,
      animate: true,
      vertical: true,
      barGroupingType: charts.BarGroupingType.grouped,
      defaultRenderer: charts.BarRendererConfig(
        groupingType: charts.BarGroupingType.grouped,
        strokeWidthPx: 1.0,
      ),
      domainAxis: charts.OrdinalAxisSpec(
        renderSpec: charts.NoneRenderSpec(),
      ),
    );
  }


  @override
  void initState() {
    super.initState();
    seriesList = _createRandomData();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("EvApp"),
        backgroundColor: Colors.red[900],
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: barChart(),
      ),
    );

  }
}

class Sales {
  final String year;
  final double sales;

  Sales(this.year, this.sales);
}

