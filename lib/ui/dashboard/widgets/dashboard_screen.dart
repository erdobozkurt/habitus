import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              'Habit Progress Overview',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            AspectRatio(
              aspectRatio: 1.6,
              child: LineChart(
                LineChartData(
                  lineBarsData: [
                    LineChartBarData(
                      isCurved: true,
                      spots: const [
                        FlSpot(1, 1.2),
                        FlSpot(2, 1.8),
                        FlSpot(3, 1.5),
                        FlSpot(4, 2.2),
                        FlSpot(5, 1.9),
                      ],
                      belowBarData: BarAreaData(show: true),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
