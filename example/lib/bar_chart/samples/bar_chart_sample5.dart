import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarChartSample5 extends StatefulWidget {
  const BarChartSample5({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => BarChartSample5State();
}

class BarChartSample5State extends State<BarChartSample5> {
  static const double barWidth = 8;
  int touchedIndex = -1;
  Color selectedBarColor = Colors.white;
  double borderWidth = 20;
  BoxShadow boxShadow = const BoxShadow(
    color: Colors.grey,
    blurRadius: 10,
    spreadRadius: 1,
  );

  @override
  Widget build(BuildContext context) {
    borderWidth = 20;
    selectedBarColor = Colors.white;
    boxShadow = const BoxShadow(
      color: Colors.grey,
      blurRadius: 10,
      spreadRadius: 2,
    );

    return AspectRatio(
      aspectRatio: 0.8,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: BarChart(
            BarChartData(
              alignment: BarChartAlignment.center,
              maxY: 20,
              minY: 0,
              groupsSpace: 20,
              barTouchData: BarTouchData(
                touchCallback: (FlTouchEvent event, barTouchResponse) {
                  if (barTouchResponse != null && barTouchResponse.spot != null) {
                    setState(() {
                      touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
                    });
                  }
                },
              ),
              titlesData: FlTitlesData(
                show: true,
                topTitles: SideTitles(showTitles: false),
                bottomTitles: SideTitles(
                  showTitles: true,
                  getTextStyles: (context, value) => const TextStyle(
                    color: Colors.black,
                    fontSize: 10,
                  ),
                  margin: 10,
                  rotateAngle: 0,
                  getTitles: (double value) {
                    return value.toInt().toString();
                  },
                ),
                leftTitles: SideTitles(
                  showTitles: true,
                  getTextStyles: (context, value) =>
                      const TextStyle(color: Colors.black, fontSize: 10),
                  // rotateAngle: ,
                  getTitles: (double value) {
                    if (value == 0) {
                      return '0';
                    }
                    return '${value.toInt()}';
                  },
                  interval: 2,
                  margin: 0,
                  reservedSize: 30,
                ),
                rightTitles: SideTitles(showTitles: false),
              ),
              gridData: FlGridData(
                show: true,
                drawVerticalLine: false,
                checkToShowHorizontalLine: (value) => value % 2 == 0,
                getDrawingHorizontalLine: (value) {
                  return FlLine(
                    color: Colors.grey,
                    strokeWidth: 0.8,
                    dashArray: [1, 5],
                  );
                },
              ),
              borderData: FlBorderData(
                show: true,
                border: const Border(bottom: BorderSide(width: 0.5)),
              ),
              barGroups: [
                BarChartGroupData(
                  x: 0,
                  barRods: [
                    BarChartRodData(
                      y: 15.1,
                      width: touchedIndex == 0 ? 10 : 8,
                      borderSide: BorderSide(
                        color: selectedBarColor,
                        width: 30,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(0)),
                      boxShadow: touchedIndex == 0 ? boxShadow : null,
                      rodStackItems: [
                        BarChartRodStackItem(
                          0,
                          2,
                          [const Color(0xff2bdb90)],
                        ),
                        BarChartRodStackItem(
                          2,
                          5,
                          [const Color(0xffffdd80)],
                        ),
                        BarChartRodStackItem(
                          5,
                          7.5,
                          [const Color(0xffff4d94)],
                        ),
                        BarChartRodStackItem(
                          7.5,
                          15.5,
                          [const Color(0xff19bfff)],
                        ),
                      ],
                    ),
                  ],
                ),
                BarChartGroupData(
                  x: 2,
                  barRods: [
                    BarChartRodData(
                      y: 13,
                      width: barWidth,
                      boxShadow: touchedIndex == 1 ? boxShadow : null,
                      borderRadius: const BorderRadius.all(Radius.zero),
                      borderSide:
                          BorderSide(color: selectedBarColor, width: touchedIndex == 1 ? 10 : 0),
                      rodStackItems: [
                        BarChartRodStackItem(
                          0,
                          1.5,
                          [const Color(0xff2bdb90)],
                        ),
                        BarChartRodStackItem(
                          1.5,
                          3.5,
                          [const Color(0xffffdd80)],
                        ),
                        BarChartRodStackItem(
                          3.5,
                          7,
                          [const Color(0xffff4d94)],
                        ),
                        BarChartRodStackItem(
                          7,
                          13,
                          [const Color(0xff19bfff)],
                        ),
                      ],
                    ),
                  ],
                ),
                BarChartGroupData(
                  x: 3,
                  barRods: [
                    BarChartRodData(
                      y: 13.5,
                      width: barWidth,
                      borderRadius: const BorderRadius.all(Radius.zero),
                      borderSide:
                          BorderSide(color: selectedBarColor, width: touchedIndex == 2 ? 10 : 0),
                      boxShadow: touchedIndex == 2 ? boxShadow : null,
                      rodStackItems: [
                        BarChartRodStackItem(
                          0,
                          1.5,
                          [const Color(0xff2bdb90)],
                        ),
                        BarChartRodStackItem(
                          1.5,
                          3,
                          [const Color(0xffffdd80)],
                        ),
                        BarChartRodStackItem(
                          3,
                          7,
                          [const Color(0xffff4d94)],
                        ),
                        BarChartRodStackItem(
                          7,
                          13.5,
                          [const Color(0xff19bfff)],
                        ),
                      ],
                    ),
                  ],
                ),
                BarChartGroupData(
                  x: 6,
                  barRods: [
                    BarChartRodData(
                      y: 16,
                      width: 10,
                      borderRadius: const BorderRadius.all(Radius.zero),
                      borderSide:
                          BorderSide(color: selectedBarColor, width: touchedIndex == 3 ? 10 : 0),
                      boxShadow: touchedIndex == 3 ? boxShadow : null,
                      rodStackItems: [
                        BarChartRodStackItem(
                          0,
                          1.2,
                          [const Color(0xff2bdb90)],
                        ),
                        BarChartRodStackItem(
                          1.2,
                          6,
                          [const Color(0xffffdd80)],
                        ),
                        BarChartRodStackItem(
                          6,
                          11,
                          [const Color(0xffff4d94)],
                        ),
                        BarChartRodStackItem(
                          11,
                          17,
                          [const Color(0xff19bfff)],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
