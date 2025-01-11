import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habitus/ui/core/themes/constants/gap_constants.dart';
import 'package:habitus/ui/core/themes/constants/padding_constants.dart';
import 'package:habitus/ui/dashboard/cubit/dashboard_cubit.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DashboardCubit, DashboardState>(
        builder: (context, state) {
          return SingleChildScrollView(
            padding: PaddingConstants.screenEdge,
            child: Column(
              children: [
                Text(
                  'Habit Progress Overview',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                GapConstants.gapSmall,
                Wrap(
                  spacing: 8,
                  children: [
                    Text('Total Habits: ${state.totalHabits}'),
                    Text(
                      '''Completion: ${(state.completionRate * 100).toStringAsFixed(0)}%''',
                    ),
                    Text('Current Streak: ${state.currentStreak}'),
                    Text(
                      '''Daily: ${(state.dailyCompletionRate * 100).toStringAsFixed(0)}%''',
                    ),
                    Text(
                      '''Weekly: ${(state.weeklyCompletionRate * 100).toStringAsFixed(0)}%''',
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                AspectRatio(
                  aspectRatio: 1.6,
                  child: LineChart(
                    LineChartData(
                      titlesData: const FlTitlesData(
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: true),
                        ),
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: true),
                        ),
                      ),
                      lineBarsData: [
                        LineChartBarData(
                          isCurved: true,
                          spots: _generateChartSpots(state.habitStats),
                          belowBarData: BarAreaData(show: true),
                          dotData: const FlDotData(show: false),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Column(
                  children: state.habits.map((habit) {
                    final stats = state.habitStats[habit.id]!;
                    return SizedBox(
                      width: double.infinity,
                      child: Card(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                habit.title,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                '''Completion Rate: ${(stats.completionRate * 100).toStringAsFixed(1)}%''',
                              ),
                              Text(
                                'Total Completions: ${stats.totalCompletions}',
                              ),
                              Text('Current Streak: ${stats.currentStreak}'),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  List<FlSpot> _generateChartSpots(Map<String, HabitStats> habitStats) {
    // Example: Aggregate completions across all habits
    double totalCompletions = 0;
    habitStats.forEach((key, stats) {
      totalCompletions += stats.totalCompletions;
    });

    // Example: Generate a simple line chart
    return habitStats.entries.map((entry) {
      final completionRate = entry.value.completionRate;
      final x = habitStats.keys.toList().indexOf(entry.key).toDouble();
      final y = completionRate * totalCompletions;
      return FlSpot(x, y);
    }).toList();
  }
}
