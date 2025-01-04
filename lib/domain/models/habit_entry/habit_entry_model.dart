import 'package:freezed_annotation/freezed_annotation.dart';

part 'habit_entry_model.freezed.dart';
part 'habit_entry_model.g.dart';

@freezed
class HabitEntry with _$HabitEntry {
  const factory HabitEntry({
    required String id,
    required String habitId,
    required DateTime date,
    @Default(false) bool isCompleted,
  }) = _HabitEntry;

  factory HabitEntry.fromJson(Map<String, dynamic> json) =>
      _$HabitEntryFromJson(json);
}
