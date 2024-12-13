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
    @Default('') String description,
    @Default(HabitType.boolean) HabitType habitType,
    @Default(FormStatus.pure) FormStatus status,
  }) = _CreateHabitState;
}
