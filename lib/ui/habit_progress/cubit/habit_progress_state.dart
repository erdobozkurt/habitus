import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:habitus/ui/create_habit/cubit/create_habit_cubit.dart';

part 'habit_progress_state.freezed.dart';

@freezed
class HabitProgressState with _$HabitProgressState {
  const factory HabitProgressState({
    required double targetValue,
    required double currentValue,
    required String id,
    required DateTime date,
    @Default(FormStatus.pure) FormStatus status,
  }) = _HabitProgressState;
}
