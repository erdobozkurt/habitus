import 'package:freezed_annotation/freezed_annotation.dart';

part 'habit_record_model.freezed.dart';
part 'habit_record_model.g.dart';

@freezed
class HabitRecord with _$HabitRecord {
  const factory HabitRecord({
    required String id,
    required String habitId,
    required DateTime date,
    @Default(false) bool isCompleted,
  }) = _HabitEntry;

  factory HabitRecord.fromJson(Map<String, dynamic> json) =>
      _$HabitRecordFromJson(json);
}
