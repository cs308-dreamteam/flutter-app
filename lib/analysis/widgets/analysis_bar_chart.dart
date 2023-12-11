import 'package:bragi/common/services/global_variables.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class AnalysisBarChart extends StatelessWidget {
  const AnalysisBarChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: GlobalVariables.authentication.user?.getAnalysisData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return BarChart(
            BarChartData(
              alignment: BarChartAlignment.spaceAround,
              maxY: 1,
              titlesData: FlTitlesData(
                show: true,
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, _) {
                      switch (value.toInt()) {
                        case 0:
                          return RotationTransition(
                            turns: AlwaysStoppedAnimation(-90 / 360),
                            child: Text(
                              'Danceability                           ',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          );
                        case 1:
                          return RotationTransition(
                            turns: AlwaysStoppedAnimation(-90 / 360),
                            child: Text(
                              'Valence                 ',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          );
                        case 2:
                          return RotationTransition(
                            turns: AlwaysStoppedAnimation(-90 / 360),
                            child: Text(
                              'Energy                ',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          );
                        case 3:
                          return RotationTransition(
                            turns: AlwaysStoppedAnimation(-90 / 360),
                            child: Text(
                              'Popularity                       ',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          );
                        default:
                          return Text(
                            '',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          );
                      }
                    },
                  ),
                ),
              ),
              barGroups: [
                BarChartGroupData(
                  x: 0,
                  barRods: [
                    BarChartRodData(
                      toY: snapshot.data['result'][0]['danceability'],
                      color: Colors.red,
                      width: 24,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(6),
                        topRight: Radius.circular(6),
                      ),
                    ),
                  ],
                ),
                BarChartGroupData(
                  x: 1,
                  barRods: [
                    BarChartRodData(
                      toY: snapshot.data['result'][0]['valence'],
                      color: Colors.red,
                      width: 24,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(6),
                        topRight: Radius.circular(6),
                      ),
                    ),
                  ],
                ),
                BarChartGroupData(
                  x: 2,
                  barRods: [
                    BarChartRodData(
                      toY: snapshot.data['result'][0]['energy'],
                      color: Colors.red,
                      width: 24,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(6),
                        topRight: Radius.circular(6),
                      ),
                    ),
                  ],
                ),
                BarChartGroupData(
                  x: 3,
                  barRods: [
                    BarChartRodData(
                      toY: double.parse(
                              snapshot.data['result'][0]['popularity']) /
                          100,
                      color: Colors.red,
                      width: 24,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(6),
                        topRight: Radius.circular(6),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            swapAnimationDuration: Duration(milliseconds: 150), // Optional
            swapAnimationCurve: Curves.linear,
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
