import 'dart:convert';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BarChartSample2 extends StatefulWidget {
  int idcurso;
  BarChartSample2(this.idcurso);
  @override
  State<StatefulWidget> createState() => BarChartSample2State();
}

class BarChartSample2State extends State<BarChartSample2> {

  Future getData() async {
    var url="http://apiuladech.grupodcv.com/est_cur1con.php?curso=${widget.idcurso}";
    final response = await http.post(url);
    return jsonDecode(response.body);
  }

  final Color leftBarColor = const Color(0xff53fdd7);
  final Color rightBarColor = const Color(0xffff5182);
  final double width = 20;

  List<BarChartGroupData> rawBarGroups;
  List<BarChartGroupData> showingBarGroups;
  int touchedGroupIndex;

  //print(json.decode(response.body));

  @override
  void initState() {
    //Future datos = getData().asStream() as Future;
    //print(datos);

    super.initState();
    final barGroup1 = makeGroupData(0, 9, 15);
    final barGroup2 = makeGroupData(1, 12, 4);
    final barGroup3 = makeGroupData(2, 10, 14);
    final barGroup4 = makeGroupData(3, 5, 12);

    final items = [
      barGroup1,
      barGroup2,
      barGroup3,
      barGroup4,
    ];

    rawBarGroups = items;
    showingBarGroups = rawBarGroups;
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
        child: AspectRatio(
          aspectRatio: 1,
          child: Card(
            elevation: 0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            color: const Color(0xff2c4260),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      makeTransactionsIcon(),
                      const SizedBox(
                        width: 38,
                      ),
                      Text(
                        'Médias x Curso',
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        'state',
                        style: TextStyle(color: const Color(0xff77839a), fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 38,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: BarChart(
                        BarChartData(
                          maxY: 20,
                          barTouchData: BarTouchData(
                              touchTooltipData: BarTouchTooltipData(
                                tooltipBgColor: Colors.grey,
                                getTooltipItem: (_a, _b, _c, _d) => null,
                              ),
                              touchCallback: (response) {
                                if (response.spot == null) {
                                  setState(() {
                                    touchedGroupIndex = -1;
                                    showingBarGroups = List.of(rawBarGroups);
                                  });
                                  return;
                                }

                                touchedGroupIndex = response.spot.touchedBarGroupIndex;

                                setState(() {
                                  if (response.touchInput is FlLongPressEnd || response.touchInput is FlPanEnd) {
                                    touchedGroupIndex = -1;
                                    showingBarGroups = List.of(rawBarGroups);
                                  } else {
                                    showingBarGroups = List.of(rawBarGroups);
                                    if (touchedGroupIndex != -1) {
                                      double sum = 0;
                                      for (BarChartRodData rod in showingBarGroups[touchedGroupIndex].barRods) {
                                        sum += rod.y;
                                      }
                                      final avg = sum / showingBarGroups[touchedGroupIndex].barRods.length;

                                      showingBarGroups[touchedGroupIndex] =
                                          showingBarGroups[touchedGroupIndex].copyWith(
                                            barRods: showingBarGroups[touchedGroupIndex].barRods.map((rod) {
                                              return rod.copyWith(y: avg);
                                            }).toList(),
                                          );
                                    }
                                  }
                                });
                              }
                          ),
                          titlesData: FlTitlesData(
                            show: true,
                            bottomTitles: SideTitles(
                              showTitles: true,
                              textStyle: TextStyle(
                                  color: const Color(0xff7589a2),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                              margin: 20,
                              getTitles: (double value) {
                                switch (value.toInt()) {
                                  case 0:
                                    return 'Total Créditos';
                                  case 1:
                                    return 'Total Periodos';
                                  case 2:
                                    return 'Nota EA';
                                  case 3:
                                    return 'Média';
                                  default:
                                    return '';
                                }
                              },
                            ),
                            leftTitles: SideTitles(
                              showTitles: true,
                              textStyle: TextStyle(
                                  color: const Color(0xff7589a2),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                              margin: 32,
                              reservedSize: 14,
                              getTitles: (value) {
                                if (value == 0) {
                                  return '1K';
                                } else if (value == 10) {
                                  return '5K';
                                } else if (value == 19) {
                                  return '10K';
                                } else {
                                  return '';
                                }
                              },
                            ),
                          ),
                          borderData: FlBorderData(
                            show: false,
                          ),
                          barGroups: showingBarGroups,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  BarChartGroupData makeGroupData(int x, double y1, double y2) {
    return BarChartGroupData(barsSpace: 4, x: x, barRods: [
      BarChartRodData(
        y: y1,
        color: leftBarColor,
        width: width,
        isRound: true,
      ),
      BarChartRodData(
        y: y2,
        color: rightBarColor,
        width: width,
        isRound: true,
      ),
    ]);
  }

  Widget makeTransactionsIcon() {
    const double width = 4.5;
    const double space = 3.5;
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: width,
          height: 10,
          color: Colors.white.withOpacity(0.4),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 28,
          color: Colors.white.withOpacity(0.8),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 42,
          color: Colors.white.withOpacity(1),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 28,
          color: Colors.white.withOpacity(0.8),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 10,
          color: Colors.white.withOpacity(0.4),
        ),
      ],
    );
  }
}