import 'package:bloc/bloc.dart';

class DashboardState {
  DashboardState({
    required this.totalHabits,
    required this.completionRate,
    required this.currentStreak,
  });
  final int totalHabits;
  final double completionRate;
  final int currentStreak;
}

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit()
      : super(
          DashboardState(
            totalHabits: 0,
            completionRate: 0,
            currentStreak: 0,
          ),
        );

  void fetchHabits() {
    // Mock data
    const total = 5;
    const completion = 0.8;
    const streak = 3;
    emit(
      DashboardState(
        totalHabits: total,
        completionRate: completion,
        currentStreak: streak,
      ),
    );
  }
}
