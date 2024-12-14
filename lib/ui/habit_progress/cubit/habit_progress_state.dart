import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:habitus/ui/create_habit/cubit/create_habit_cubit.dart';

part 'habit_progress_state.freezed.dart';

@freezed
class HabitProgressState with _$HabitProgressState {
  const factory HabitProgressState({
    required String id,
    @Default(0.0) double currentValue,
    @Default(0.0) double targetValue,
    @Default(FormStatus.pure) FormStatus status,
    String? error,
  }) = _HabitProgressState;
}
