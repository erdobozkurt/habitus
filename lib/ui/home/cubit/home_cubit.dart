import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:habitus/data/repositories/habit/habit_repository.dart';
import 'package:habitus/domain/enums/status.dart';
import 'package:habitus/domain/models/habit/habit_model.dart';
import 'package:habitus/domain/models/habit_record/habit_record_model.dart';

part 'home_cubit.freezed.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required IHabitRepository habitRepository})
      : _habitRepository = habitRepository,
        super(const HomeState());

  final IHabitRepository _habitRepository;

  Future<void> loadHabitsForDate(DateTime date) async {
    emit(state.copyWith(status: Status.loading));

    try {
      final habits = await _habitRepository.getHabits();
      final records = await _habitRepository.getHabitRecordsForDate(date);

      emit(
        state.copyWith(
          habits: habits,
          habitRecords: records,
          selectedDate: date,
          status: Status.loaded,
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: Status.error));
    }
  }

  Future<void> toggleHabitCompletion(
    HabitRecord record, {
    bool? completed,
  }) async {
    emit(state.copyWith(toggleStatus: Status.loading));
    try {
      final updatedRecord = record.copyWith(
        isCompleted: completed ?? !record.isCompleted,
      );

      await _habitRepository.updateHabitRecord(updatedRecord);
      if (state.selectedDate != null) {
        await loadHabitsForDate(state.selectedDate!);
      }
      emit(state.copyWith(toggleStatus: Status.loaded));
    } catch (e) {
      emit(state.copyWith(toggleStatus: Status.error));
    }
  }

  Future<void> updateHabitProgress(
    HabitRecord record,
    double value,
  ) async {
    try {
      final updatedRecord = record.copyWith(
        value: value,
        isCompleted: value >= record.habit.target,
        date: record.date,
      );

      await _habitRepository.updateHabitRecord(updatedRecord);

      if (state.selectedDate != null) {
        await loadHabitsForDate(state.selectedDate!);
      }
    } catch (e) {
      emit(state.copyWith(status: Status.error));
    }
  }

  Future<void> optimisticLoadHabitsForDate(DateTime date) async {
    final currentHabits = state.habits;
    final optimisticRecords = currentHabits.map((habit) {
      return HabitRecord(
        habit: habit,
        date: date,
        isCompleted: false,
      );
    }).toList();

    emit(
      state.copyWith(
        selectedDate: date,
        habitRecords: optimisticRecords,
      ),
    );

    try {
      final records = await _habitRepository.getHabitRecordsForDate(date);
      emit(state.copyWith(habitRecords: records));
    } catch (e) {
      emit(state.copyWith(status: Status.error));
    }
  }
}
