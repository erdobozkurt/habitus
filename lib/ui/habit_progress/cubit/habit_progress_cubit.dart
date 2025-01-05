import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habitus/data/repositories/habit/habit_repository.dart';
import 'package:habitus/domain/models/habit/habit_model.dart';
import 'package:habitus/ui/create_habit/cubit/create_habit_cubit.dart';
import 'package:habitus/ui/habit_progress/cubit/habit_progress_state.dart';

class HabitProgressCubit extends Cubit<HabitProgressState> {
  HabitProgressCubit({
    required IHabitRepository habitRepository,
    required Habit habit,
  })  : _habitRepository = habitRepository,
        super(
          HabitProgressState(
            targetValue: habit.target,
            currentValue: habit.current,
            id: habit.id,
          ),
        );

  final IHabitRepository _habitRepository;

  void updateProgress(double value) {
    emit(state.copyWith(currentValue: value));
  }

  Future<void> saveProgress() async {
    emit(state.copyWith(status: FormStatus.submissionInProgress));
    try {
      await _habitRepository.saveProgress(
        state.id,
        state.currentValue,
      );
      emit(state.copyWith(status: FormStatus.submissionSuccess));
    } catch (e) {
      emit(state.copyWith(status: FormStatus.submissionFailure));
    }
  }
}
