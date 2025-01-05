// habit_model.dart
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:habitus/domain/models/habit_record/habit_record_model.dart';
import 'package:habitus/ui/create_habit/cubit/create_habit_cubit.dart';

part 'habit_model.freezed.dart';
part 'habit_model.g.dart';

@JsonSerializable()
class ColorConverter implements JsonConverter<Color, int> {
  const ColorConverter();

  @override
  Color fromJson(int json) => Color(json);

  @override
  int toJson(Color color) => color.value;
}

class TimeOfDayConverter implements JsonConverter<TimeOfDay?, String?> {
  const TimeOfDayConverter();

  @override
  TimeOfDay? fromJson(String? json) {
    if (json == null) return null;
    final parts = json.split(':');
    return TimeOfDay(
      hour: int.parse(parts[0]),
      minute: int.parse(parts[1]),
    );
  }

  @override
  String? toJson(TimeOfDay? time) {
    if (time == null) return null;
    return '''${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}''';
  }
}

@freezed
class Habit with _$Habit {
  const factory Habit({
    required String id,
    required String title,
    required String question,
    required List<String> repeatDays,
    @Default([]) List<HabitRecord> entries,
    @Default(HabitType.boolean) HabitType type,
    @TimeOfDayConverter() TimeOfDay? reminderTime,
    @Default('✨') String emoji,
    @ColorConverter() @Default(Colors.blue) Color color,
    @Default(false) bool isCompleted,
    @Default(0.0) double current,
    @Default(0.0) double target,
  }) = _Habit;

  factory Habit.fromJson(Map<String, dynamic> json) => _$HabitFromJson(json);
}
