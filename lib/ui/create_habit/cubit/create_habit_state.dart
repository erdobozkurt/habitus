// create_habit_state.dart
part of 'create_habit_cubit.dart';

enum HabitType { boolean, measurable }

enum FormStatus {
  pure,
  submissionInProgress,
  submissionSuccess,
  submissionFailure
}

@freezed
class CreateHabitState with _$CreateHabitState {
  const factory CreateHabitState({
    @Default('') String name,
    @Default('') String question,
    @Default(HabitType.boolean) HabitType habitType,
    @Default(FormStatus.pure) FormStatus status,
    @Default(Colors.blue) Color color,
    @Default('✨') String emoji,
    @Default(0) double target,
    TimeOfDay? reminderTime,
    @Default(<String>[
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday',
    ])
    List<String> repeatDays,
  }) = _CreateHabitState;
}
