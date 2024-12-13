// create_habit_cubit.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:habitus/data/repositories/habit/habit_repository.dart';
import 'package:habitus/domain/models/habit/habit_model.dart';

part 'create_habit_cubit.freezed.dart';
part 'create_habit_state.dart';

class CreateHabitCubit extends Cubit<CreateHabitState> {
  CreateHabitCubit({required IHabitRepository habitRepository})
      : _habitRepository = habitRepository,
        super(const CreateHabitState());

  final IHabitRepository _habitRepository;

  void nameChanged(String name) {
    emit(state.copyWith(name: name));
  }

  void descriptionChanged(String description) {
    emit(state.copyWith(description: description));
  }

  void habitTypeChanged(HabitType type) {
    emit(state.copyWith(habitType: type));
  }

  Future<void> saveHabit() async {
    emit(state.copyWith(status: FormStatus.submissionInProgress));
    try {
      final habit = state.habitType == HabitType.boolean
          ? Habit.boolean(
              id: UniqueKey().toString(),
              title: state.name,
              description: state.description,
              time: DateTime.now(),
            )
          : Habit.measurable(
              id: UniqueKey().toString(),
              title: state.name,
              description: state.description,
              time: DateTime.now(),
              target: 1, // Set an appropriate target
            );
      await _habitRepository.createHabit(habit);
      emit(state.copyWith(status: FormStatus.submissionSuccess));
    } catch (e) {
      emit(state.copyWith(status: FormStatus.submissionFailure));
    }
  }
}
