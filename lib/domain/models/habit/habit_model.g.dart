// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ColorConverter _$ColorConverterFromJson(Map<String, dynamic> json) =>
    ColorConverter();

Map<String, dynamic> _$ColorConverterToJson(ColorConverter instance) =>
    <String, dynamic>{};

_$HabitImpl _$$HabitImplFromJson(Map<String, dynamic> json) => _$HabitImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      question: json['question'] as String,
      repeatDays: (json['repeatDays'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      type: $enumDecodeNullable(_$HabitTypeEnumMap, json['type']) ??
          HabitType.boolean,
      reminderTime:
          const TimeOfDayConverter().fromJson(json['reminderTime'] as String?),
      emoji: json['emoji'] as String? ?? '✨',
      color: json['color'] == null
          ? Colors.blue
          : const ColorConverter().fromJson((json['color'] as num).toInt()),
      target: (json['target'] as num?)?.toDouble() ?? 0.0,
      current: (json['current'] as num?)?.toDouble() ?? 0.0,
      isCompleted: json['isCompleted'] as bool? ?? false,
    );

Map<String, dynamic> _$$HabitImplToJson(_$HabitImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'question': instance.question,
      'repeatDays': instance.repeatDays,
      'type': _$HabitTypeEnumMap[instance.type]!,
      'reminderTime': const TimeOfDayConverter().toJson(instance.reminderTime),
      'emoji': instance.emoji,
      'color': const ColorConverter().toJson(instance.color),
      'target': instance.target,
      'current': instance.current,
      'isCompleted': instance.isCompleted,
    };

const _$HabitTypeEnumMap = {
  HabitType.boolean: 'boolean',
  HabitType.measurable: 'measurable',
};
