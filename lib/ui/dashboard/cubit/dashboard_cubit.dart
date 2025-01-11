import 'package:bloc/bloc.dart';
import 'package:habitus/data/repositories/habit/habit_repository.dart';
import 'package:habitus/domain/models/habit/habit_model.dart';

class DashboardState {
  DashboardState({
    required this.totalHabits,
    required this.completionRate,
    required this.currentStreak,
    required this.habits,
    required this.dailyCompletionRate,
    required this.weeklyCompletionRate,
    required this.habitStats,
  });
  final int totalHabits;
  final double completionRate;
  final int currentStreak;
  final List<Habit> habits;
  final double dailyCompletionRate;
  final double weeklyCompletionRate;
  final Map<String, HabitStats> habitStats;
}

class HabitStats {
  HabitStats({
    required this.totalCompletions,
    required this.currentStreak,
    required this.completionRate,
  });
  final int totalCompletions;
  final int currentStreak;
  final double completionRate;
}

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit(this._habitRepository)
      : super(
          DashboardState(
            totalHabits: 0,
            completionRate: 0,
            currentStreak: 0,
            habits: const [],
            dailyCompletionRate: 0,
            weeklyCompletionRate: 0,
            habitStats: const {},
          ),
        );
  final IHabitRepository _habitRepository;

  Future<void> fetchHabits() async {
    final habits = await _habitRepository.getHabits();
    final records = await _habitRepository.getAllHabitRecords();
    final totalRecords = records.length;
    final completedRecords = records.where((r) => r.isCompleted).length;
    final globalCompletion =
        totalRecords == 0 ? 0 : completedRecords / totalRecords;

    // Mock daily completion
    final today = DateTime.now();
    final dailyRecords = records.where(
      (r) =>
          r.date.year == today.year &&
          r.date.month == today.month &&
          r.date.day == today.day,
    );
    final dailyRate = dailyRecords.isEmpty
        ? 0
        : dailyRecords.where((r) => r.isCompleted).length / dailyRecords.length;

    // Mock weekly completion (last 7 days)
    final weekAgo = today.subtract(const Duration(days: 7));
    final weeklyRecords = records.where((r) => r.date.isAfter(weekAgo));
    final weeklyRate = weeklyRecords.isEmpty
        ? 0
        : weeklyRecords.where((r) => r.isCompleted).length /
            weeklyRecords.length;

    // Calculate per-habit stats
    final stats = <String, HabitStats>{};
    for (final habit in habits) {
      final habitRecords =
          records.where((r) => r.habit.id == habit.id).toList();
      final completions = habitRecords.where((r) => r.isCompleted).length;
      final rate = habitRecords.isEmpty ? 0 : completions / habitRecords.length;

      // Simple streak calculation
      var streak = 0;
      for (var i = habitRecords.length - 1; i >= 0; i--) {
        if (habitRecords[i].isCompleted) {
          streak++;
        } else {
          break;
        }
      }

      stats[habit.id] = HabitStats(
        totalCompletions: completions,
        currentStreak: streak,
        completionRate: rate.roundToDouble(),
      );
    }

    emit(
      DashboardState(
        totalHabits: habits.length,
        completionRate: globalCompletion.roundToDouble(),
        currentStreak: 4, // mock example
        habits: habits,
        dailyCompletionRate: dailyRate.roundToDouble(),
        weeklyCompletionRate: weeklyRate.roundToDouble(),
        habitStats: stats,
      ),
    );
  }
}
