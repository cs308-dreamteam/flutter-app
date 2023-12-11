import 'package:bragi/analysis/widgets/analysis_bar_chart.dart';
import 'package:bragi/common/widgets/simple_title.dart';
import 'package:flutter/material.dart';

class AnalysisScreen extends StatelessWidget {
  const AnalysisScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SimpleTitle(firstPart: 'Your', secondPart: 'Analysis'),
            ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 200),
              child: AnalysisBarChart(),
            ),
          ],
        ),
      ),
    );
  }
}
