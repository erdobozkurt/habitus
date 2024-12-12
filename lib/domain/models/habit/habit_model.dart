// habit_model.dart
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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

@freezed
class Habit with _$Habit {
  const factory Habit.boolean({
    required String id,
    required String title,
    required String description,
    required DateTime time,
    @Default('✨') String emoji,
    @ColorConverter() @Default(Colors.blue) Color color,
    @Default(false) bool isCompleted,
  }) = BooleanHabit;

  const factory Habit.measurable({
    required String id,
    required String title,
    required String description,
    required DateTime time,
    required double target,
    @Default(0.0) double current,
    @Default('✨') String emoji,
    @ColorConverter() @Default(Colors.blue) Color color,
  }) = MeasurableHabit;

  factory Habit.fromJson(Map<String, dynamic> json) => _$HabitFromJson(json);
}
