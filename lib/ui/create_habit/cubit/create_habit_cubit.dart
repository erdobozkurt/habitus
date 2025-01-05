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

  void questionChanged(String question) {
    emit(state.copyWith(question: question));
  }

  void habitTypeChanged(HabitType type) {
    emit(state.copyWith(habitType: type));
  }

  void targetChanged(double target) {
    emit(state.copyWith(target: target));
  }

  void reminderTimeChanged(TimeOfDay time) {
    emit(state.copyWith(reminderTime: time));
  }

  void repeatDaysChanged(List<String> days) {
    emit(state.copyWith(repeatDays: days));
  }

  void colorChanged(Color color) {
    emit(state.copyWith(color: color));
  }

  void emojiChanged(String emoji) {
    emit(state.copyWith(emoji: emoji));
  }

  Future<void> saveHabit() async {
    emit(state.copyWith(status: FormStatus.submissionInProgress));
    try {
      final habit = state.habitType == HabitType.boolean
          ? Habit(
              id: UniqueKey().toString(),
              title: state.name,
              question: state.question,
              reminderTime: state.reminderTime,
              repeatDays: state.repeatDays,
              color: state.color,
              emoji: state.emoji,
            )
          : Habit(
              id: UniqueKey().toString(),
              title: state.name,
              question: state.question,
              target: state.target ?? 0.0,
              repeatDays: state.repeatDays,
              reminderTime: state.reminderTime,
              color: state.color,
              emoji: state.emoji,
            );
      await _habitRepository.createHabit(habit);
      emit(state.copyWith(status: FormStatus.submissionSuccess));
    } catch (e) {
      emit(state.copyWith(status: FormStatus.submissionFailure));
    } finally {
      //clear all fields
      emit(const CreateHabitState());
    }
  }
}
