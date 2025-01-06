// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit_record_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HabitEntryImpl _$$HabitEntryImplFromJson(Map<String, dynamic> json) =>
    _$HabitEntryImpl(
      habit: Habit.fromJson(json['habit'] as Map<String, dynamic>),
      date: DateTime.parse(json['date'] as String),
      isCompleted: json['isCompleted'] as bool,
      value: (json['value'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$HabitEntryImplToJson(_$HabitEntryImpl instance) =>
    <String, dynamic>{
      'habit': instance.habit,
      'date': instance.date.toIso8601String(),
      'isCompleted': instance.isCompleted,
      'value': instance.value,
    };
