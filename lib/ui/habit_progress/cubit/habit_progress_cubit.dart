import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habitus/data/repositories/habit/habit_repository.dart';
import 'package:habitus/domain/models/habit_record/habit_record_model.dart';
import 'package:habitus/ui/create_habit/cubit/create_habit_cubit.dart';
import 'package:habitus/ui/habit_progress/cubit/habit_progress_state.dart';

class HabitProgressCubit extends Cubit<HabitProgressState> {
  HabitProgressCubit({
    required IHabitRepository habitRepository,
    required HabitRecord record,
  })  : _habitRepository = habitRepository,
        super(
          HabitProgressState(
            targetValue: record.habit.target,
            currentValue: record.value,
            id: record.habit.id,
            date: record.date,
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
        date: state.date,
      );
      emit(state.copyWith(status: FormStatus.submissionSuccess));
    } catch (e) {
      emit(state.copyWith(status: FormStatus.submissionFailure));
    }
  }
}
