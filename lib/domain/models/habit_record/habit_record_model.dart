import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:habitus/domain/models/habit/habit_model.dart';

part 'habit_record_model.freezed.dart';
part 'habit_record_model.g.dart';

@freezed
class HabitRecord with _$HabitRecord {
  const factory HabitRecord({
    required Habit habit,
    required DateTime date,
    required bool isCompleted,
    @Default(0.0) double value,
  }) = _HabitEntry;

  factory HabitRecord.fromJson(Map<String, dynamic> json) =>
      _$HabitRecordFromJson(json);
}
