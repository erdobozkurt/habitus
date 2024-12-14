// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ColorConverter _$ColorConverterFromJson(Map<String, dynamic> json) =>
    const ColorConverter();

Map<String, dynamic> _$ColorConverterToJson(ColorConverter instance) =>
    <String, dynamic>{};

_$BooleanHabitImpl _$$BooleanHabitImplFromJson(Map<String, dynamic> json) =>
    _$BooleanHabitImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      question: json['question'] as String,
      repeatDays: (json['repeatDays'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      reminderTime:
          const TimeOfDayConverter().fromJson(json['reminderTime'] as String?),
      emoji: json['emoji'] as String? ?? '✨',
      color: json['color'] == null
          ? Colors.blue
          : const ColorConverter().fromJson((json['color'] as num).toInt()),
      isCompleted: json['isCompleted'] as bool? ?? false,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$BooleanHabitImplToJson(_$BooleanHabitImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'question': instance.question,
      'repeatDays': instance.repeatDays,
      'reminderTime': const TimeOfDayConverter().toJson(instance.reminderTime),
      'emoji': instance.emoji,
      'color': const ColorConverter().toJson(instance.color),
      'isCompleted': instance.isCompleted,
      'runtimeType': instance.$type,
    };

_$MeasurableHabitImpl _$$MeasurableHabitImplFromJson(
  Map<String, dynamic> json,
) =>
    _$MeasurableHabitImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      question: json['question'] as String,
      target: (json['target'] as num).toDouble(),
      repeatDays: (json['repeatDays'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      reminderTime:
          const TimeOfDayConverter().fromJson(json['reminderTime'] as String?),
      current: (json['current'] as num?)?.toDouble() ?? 0.0,
      emoji: json['emoji'] as String? ?? '✨',
      color: json['color'] == null
          ? Colors.blue
          : const ColorConverter().fromJson((json['color'] as num).toInt()),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$MeasurableHabitImplToJson(
  _$MeasurableHabitImpl instance,
) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'question': instance.question,
      'target': instance.target,
      'repeatDays': instance.repeatDays,
      'reminderTime': const TimeOfDayConverter().toJson(instance.reminderTime),
      'current': instance.current,
      'emoji': instance.emoji,
      'color': const ColorConverter().toJson(instance.color),
      'runtimeType': instance.$type,
    };
