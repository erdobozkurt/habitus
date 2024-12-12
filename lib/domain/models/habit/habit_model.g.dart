// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ColorConverter _$ColorConverterFromJson(Map<String, dynamic> json) =>
    ColorConverter();

Map<String, dynamic> _$ColorConverterToJson(ColorConverter instance) =>
    <String, dynamic>{};

_$BooleanHabitImpl _$$BooleanHabitImplFromJson(Map<String, dynamic> json) =>
    _$BooleanHabitImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      time: DateTime.parse(json['time'] as String),
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
      'description': instance.description,
      'time': instance.time.toIso8601String(),
      'emoji': instance.emoji,
      'color': const ColorConverter().toJson(instance.color),
      'isCompleted': instance.isCompleted,
      'runtimeType': instance.$type,
    };

_$MeasurableHabitImpl _$$MeasurableHabitImplFromJson(
        Map<String, dynamic> json) =>
    _$MeasurableHabitImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      time: DateTime.parse(json['time'] as String),
      target: (json['target'] as num).toDouble(),
      current: (json['current'] as num?)?.toDouble() ?? 0.0,
      emoji: json['emoji'] as String? ?? '✨',
      color: json['color'] == null
          ? Colors.blue
          : const ColorConverter().fromJson((json['color'] as num).toInt()),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$MeasurableHabitImplToJson(
        _$MeasurableHabitImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'time': instance.time.toIso8601String(),
      'target': instance.target,
      'current': instance.current,
      'emoji': instance.emoji,
      'color': const ColorConverter().toJson(instance.color),
      'runtimeType': instance.$type,
    };
