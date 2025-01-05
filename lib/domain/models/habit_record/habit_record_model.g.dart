// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit_record_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HabitEntryImpl _$$HabitEntryImplFromJson(Map<String, dynamic> json) =>
    _$HabitEntryImpl(
      id: json['id'] as String,
      habitId: json['habitId'] as String,
      date: DateTime.parse(json['date'] as String),
      isCompleted: json['isCompleted'] as bool? ?? false,
    );

Map<String, dynamic> _$$HabitEntryImplToJson(_$HabitEntryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'habitId': instance.habitId,
      'date': instance.date.toIso8601String(),
      'isCompleted': instance.isCompleted,
    };
