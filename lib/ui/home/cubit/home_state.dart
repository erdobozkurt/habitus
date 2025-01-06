part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default([]) List<Habit> habits,
    @Default([]) List<HabitRecord> habitRecords,
    @Default(Status.initial) Status status,
    @Default(Status.initial) Status toggleStatus,
    DateTime? selectedDate,
  }) = _HomeState;
}
