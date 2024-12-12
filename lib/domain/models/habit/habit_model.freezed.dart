// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'habit_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Habit _$HabitFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'boolean':
      return BooleanHabit.fromJson(json);
    case 'measurable':
      return MeasurableHabit.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'Habit',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$Habit {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  DateTime get time => throw _privateConstructorUsedError;
  String get emoji => throw _privateConstructorUsedError;
  @ColorConverter()
  Color get color => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String id,
            String title,
            String description,
            DateTime time,
            String emoji,
            @ColorConverter() Color color,
            bool isCompleted)
        boolean,
    required TResult Function(
            String id,
            String title,
            String description,
            DateTime time,
            double target,
            double current,
            String emoji,
            @ColorConverter() Color color)
        measurable,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String id,
            String title,
            String description,
            DateTime time,
            String emoji,
            @ColorConverter() Color color,
            bool isCompleted)?
        boolean,
    TResult? Function(
            String id,
            String title,
            String description,
            DateTime time,
            double target,
            double current,
            String emoji,
            @ColorConverter() Color color)?
        measurable,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, String title, String description, DateTime time,
            String emoji, @ColorConverter() Color color, bool isCompleted)?
        boolean,
    TResult Function(
            String id,
            String title,
            String description,
            DateTime time,
            double target,
            double current,
            String emoji,
            @ColorConverter() Color color)?
        measurable,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BooleanHabit value) boolean,
    required TResult Function(MeasurableHabit value) measurable,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BooleanHabit value)? boolean,
    TResult? Function(MeasurableHabit value)? measurable,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BooleanHabit value)? boolean,
    TResult Function(MeasurableHabit value)? measurable,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this Habit to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Habit
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HabitCopyWith<Habit> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HabitCopyWith<$Res> {
  factory $HabitCopyWith(Habit value, $Res Function(Habit) then) =
      _$HabitCopyWithImpl<$Res, Habit>;
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      DateTime time,
      String emoji,
      @ColorConverter() Color color});
}

/// @nodoc
class _$HabitCopyWithImpl<$Res, $Val extends Habit>
    implements $HabitCopyWith<$Res> {
  _$HabitCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Habit
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? time = null,
    Object? emoji = null,
    Object? color = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
      emoji: null == emoji
          ? _value.emoji
          : emoji // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BooleanHabitImplCopyWith<$Res>
    implements $HabitCopyWith<$Res> {
  factory _$$BooleanHabitImplCopyWith(
          _$BooleanHabitImpl value, $Res Function(_$BooleanHabitImpl) then) =
      __$$BooleanHabitImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      DateTime time,
      String emoji,
      @ColorConverter() Color color,
      bool isCompleted});
}

/// @nodoc
class __$$BooleanHabitImplCopyWithImpl<$Res>
    extends _$HabitCopyWithImpl<$Res, _$BooleanHabitImpl>
    implements _$$BooleanHabitImplCopyWith<$Res> {
  __$$BooleanHabitImplCopyWithImpl(
      _$BooleanHabitImpl _value, $Res Function(_$BooleanHabitImpl) _then)
      : super(_value, _then);

  /// Create a copy of Habit
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? time = null,
    Object? emoji = null,
    Object? color = null,
    Object? isCompleted = null,
  }) {
    return _then(_$BooleanHabitImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
      emoji: null == emoji
          ? _value.emoji
          : emoji // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BooleanHabitImpl implements BooleanHabit {
  const _$BooleanHabitImpl(
      {required this.id,
      required this.title,
      required this.description,
      required this.time,
      this.emoji = '✨',
      @ColorConverter() this.color = Colors.blue,
      this.isCompleted = false,
      final String? $type})
      : $type = $type ?? 'boolean';

  factory _$BooleanHabitImpl.fromJson(Map<String, dynamic> json) =>
      _$$BooleanHabitImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final DateTime time;
  @override
  @JsonKey()
  final String emoji;
  @override
  @JsonKey()
  @ColorConverter()
  final Color color;
  @override
  @JsonKey()
  final bool isCompleted;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Habit.boolean(id: $id, title: $title, description: $description, time: $time, emoji: $emoji, color: $color, isCompleted: $isCompleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BooleanHabitImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.emoji, emoji) || other.emoji == emoji) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, description, time, emoji, color, isCompleted);

  /// Create a copy of Habit
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BooleanHabitImplCopyWith<_$BooleanHabitImpl> get copyWith =>
      __$$BooleanHabitImplCopyWithImpl<_$BooleanHabitImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String id,
            String title,
            String description,
            DateTime time,
            String emoji,
            @ColorConverter() Color color,
            bool isCompleted)
        boolean,
    required TResult Function(
            String id,
            String title,
            String description,
            DateTime time,
            double target,
            double current,
            String emoji,
            @ColorConverter() Color color)
        measurable,
  }) {
    return boolean(id, title, description, time, emoji, color, isCompleted);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String id,
            String title,
            String description,
            DateTime time,
            String emoji,
            @ColorConverter() Color color,
            bool isCompleted)?
        boolean,
    TResult? Function(
            String id,
            String title,
            String description,
            DateTime time,
            double target,
            double current,
            String emoji,
            @ColorConverter() Color color)?
        measurable,
  }) {
    return boolean?.call(
        id, title, description, time, emoji, color, isCompleted);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, String title, String description, DateTime time,
            String emoji, @ColorConverter() Color color, bool isCompleted)?
        boolean,
    TResult Function(
            String id,
            String title,
            String description,
            DateTime time,
            double target,
            double current,
            String emoji,
            @ColorConverter() Color color)?
        measurable,
    required TResult orElse(),
  }) {
    if (boolean != null) {
      return boolean(id, title, description, time, emoji, color, isCompleted);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BooleanHabit value) boolean,
    required TResult Function(MeasurableHabit value) measurable,
  }) {
    return boolean(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BooleanHabit value)? boolean,
    TResult? Function(MeasurableHabit value)? measurable,
  }) {
    return boolean?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BooleanHabit value)? boolean,
    TResult Function(MeasurableHabit value)? measurable,
    required TResult orElse(),
  }) {
    if (boolean != null) {
      return boolean(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$BooleanHabitImplToJson(
      this,
    );
  }
}

abstract class BooleanHabit implements Habit {
  const factory BooleanHabit(
      {required final String id,
      required final String title,
      required final String description,
      required final DateTime time,
      final String emoji,
      @ColorConverter() final Color color,
      final bool isCompleted}) = _$BooleanHabitImpl;

  factory BooleanHabit.fromJson(Map<String, dynamic> json) =
      _$BooleanHabitImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get description;
  @override
  DateTime get time;
  @override
  String get emoji;
  @override
  @ColorConverter()
  Color get color;
  bool get isCompleted;

  /// Create a copy of Habit
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BooleanHabitImplCopyWith<_$BooleanHabitImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MeasurableHabitImplCopyWith<$Res>
    implements $HabitCopyWith<$Res> {
  factory _$$MeasurableHabitImplCopyWith(_$MeasurableHabitImpl value,
          $Res Function(_$MeasurableHabitImpl) then) =
      __$$MeasurableHabitImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      DateTime time,
      double target,
      double current,
      String emoji,
      @ColorConverter() Color color});
}

/// @nodoc
class __$$MeasurableHabitImplCopyWithImpl<$Res>
    extends _$HabitCopyWithImpl<$Res, _$MeasurableHabitImpl>
    implements _$$MeasurableHabitImplCopyWith<$Res> {
  __$$MeasurableHabitImplCopyWithImpl(
      _$MeasurableHabitImpl _value, $Res Function(_$MeasurableHabitImpl) _then)
      : super(_value, _then);

  /// Create a copy of Habit
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? time = null,
    Object? target = null,
    Object? current = null,
    Object? emoji = null,
    Object? color = null,
  }) {
    return _then(_$MeasurableHabitImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
      target: null == target
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as double,
      current: null == current
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as double,
      emoji: null == emoji
          ? _value.emoji
          : emoji // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MeasurableHabitImpl implements MeasurableHabit {
  const _$MeasurableHabitImpl(
      {required this.id,
      required this.title,
      required this.description,
      required this.time,
      required this.target,
      this.current = 0.0,
      this.emoji = '✨',
      @ColorConverter() this.color = Colors.blue,
      final String? $type})
      : $type = $type ?? 'measurable';

  factory _$MeasurableHabitImpl.fromJson(Map<String, dynamic> json) =>
      _$$MeasurableHabitImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  final DateTime time;
  @override
  final double target;
  @override
  @JsonKey()
  final double current;
  @override
  @JsonKey()
  final String emoji;
  @override
  @JsonKey()
  @ColorConverter()
  final Color color;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Habit.measurable(id: $id, title: $title, description: $description, time: $time, target: $target, current: $current, emoji: $emoji, color: $color)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MeasurableHabitImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.target, target) || other.target == target) &&
            (identical(other.current, current) || other.current == current) &&
            (identical(other.emoji, emoji) || other.emoji == emoji) &&
            (identical(other.color, color) || other.color == color));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, description, time, target, current, emoji, color);

  /// Create a copy of Habit
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MeasurableHabitImplCopyWith<_$MeasurableHabitImpl> get copyWith =>
      __$$MeasurableHabitImplCopyWithImpl<_$MeasurableHabitImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String id,
            String title,
            String description,
            DateTime time,
            String emoji,
            @ColorConverter() Color color,
            bool isCompleted)
        boolean,
    required TResult Function(
            String id,
            String title,
            String description,
            DateTime time,
            double target,
            double current,
            String emoji,
            @ColorConverter() Color color)
        measurable,
  }) {
    return measurable(
        id, title, description, time, target, current, emoji, color);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String id,
            String title,
            String description,
            DateTime time,
            String emoji,
            @ColorConverter() Color color,
            bool isCompleted)?
        boolean,
    TResult? Function(
            String id,
            String title,
            String description,
            DateTime time,
            double target,
            double current,
            String emoji,
            @ColorConverter() Color color)?
        measurable,
  }) {
    return measurable?.call(
        id, title, description, time, target, current, emoji, color);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, String title, String description, DateTime time,
            String emoji, @ColorConverter() Color color, bool isCompleted)?
        boolean,
    TResult Function(
            String id,
            String title,
            String description,
            DateTime time,
            double target,
            double current,
            String emoji,
            @ColorConverter() Color color)?
        measurable,
    required TResult orElse(),
  }) {
    if (measurable != null) {
      return measurable(
          id, title, description, time, target, current, emoji, color);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BooleanHabit value) boolean,
    required TResult Function(MeasurableHabit value) measurable,
  }) {
    return measurable(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BooleanHabit value)? boolean,
    TResult? Function(MeasurableHabit value)? measurable,
  }) {
    return measurable?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BooleanHabit value)? boolean,
    TResult Function(MeasurableHabit value)? measurable,
    required TResult orElse(),
  }) {
    if (measurable != null) {
      return measurable(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$MeasurableHabitImplToJson(
      this,
    );
  }
}

abstract class MeasurableHabit implements Habit {
  const factory MeasurableHabit(
      {required final String id,
      required final String title,
      required final String description,
      required final DateTime time,
      required final double target,
      final double current,
      final String emoji,
      @ColorConverter() final Color color}) = _$MeasurableHabitImpl;

  factory MeasurableHabit.fromJson(Map<String, dynamic> json) =
      _$MeasurableHabitImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get description;
  @override
  DateTime get time;
  double get target;
  double get current;
  @override
  String get emoji;
  @override
  @ColorConverter()
  Color get color;

  /// Create a copy of Habit
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MeasurableHabitImplCopyWith<_$MeasurableHabitImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
