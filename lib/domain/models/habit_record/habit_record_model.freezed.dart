// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'habit_record_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HabitRecord _$HabitRecordFromJson(Map<String, dynamic> json) {
  return _HabitEntry.fromJson(json);
}

/// @nodoc
mixin _$HabitRecord {
  Habit get habit => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  bool get isCompleted => throw _privateConstructorUsedError;
  double get value => throw _privateConstructorUsedError;

  /// Serializes this HabitRecord to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HabitRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HabitRecordCopyWith<HabitRecord> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HabitRecordCopyWith<$Res> {
  factory $HabitRecordCopyWith(
          HabitRecord value, $Res Function(HabitRecord) then) =
      _$HabitRecordCopyWithImpl<$Res, HabitRecord>;
  @useResult
  $Res call({Habit habit, DateTime date, bool isCompleted, double value});

  $HabitCopyWith<$Res> get habit;
}

/// @nodoc
class _$HabitRecordCopyWithImpl<$Res, $Val extends HabitRecord>
    implements $HabitRecordCopyWith<$Res> {
  _$HabitRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HabitRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? habit = null,
    Object? date = null,
    Object? isCompleted = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      habit: null == habit
          ? _value.habit
          : habit // ignore: cast_nullable_to_non_nullable
              as Habit,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }

  /// Create a copy of HabitRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HabitCopyWith<$Res> get habit {
    return $HabitCopyWith<$Res>(_value.habit, (value) {
      return _then(_value.copyWith(habit: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HabitEntryImplCopyWith<$Res>
    implements $HabitRecordCopyWith<$Res> {
  factory _$$HabitEntryImplCopyWith(
          _$HabitEntryImpl value, $Res Function(_$HabitEntryImpl) then) =
      __$$HabitEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Habit habit, DateTime date, bool isCompleted, double value});

  @override
  $HabitCopyWith<$Res> get habit;
}

/// @nodoc
class __$$HabitEntryImplCopyWithImpl<$Res>
    extends _$HabitRecordCopyWithImpl<$Res, _$HabitEntryImpl>
    implements _$$HabitEntryImplCopyWith<$Res> {
  __$$HabitEntryImplCopyWithImpl(
      _$HabitEntryImpl _value, $Res Function(_$HabitEntryImpl) _then)
      : super(_value, _then);

  /// Create a copy of HabitRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? habit = null,
    Object? date = null,
    Object? isCompleted = null,
    Object? value = null,
  }) {
    return _then(_$HabitEntryImpl(
      habit: null == habit
          ? _value.habit
          : habit // ignore: cast_nullable_to_non_nullable
              as Habit,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HabitEntryImpl implements _HabitEntry {
  const _$HabitEntryImpl(
      {required this.habit,
      required this.date,
      required this.isCompleted,
      this.value = 0.0});

  factory _$HabitEntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$HabitEntryImplFromJson(json);

  @override
  final Habit habit;
  @override
  final DateTime date;
  @override
  final bool isCompleted;
  @override
  @JsonKey()
  final double value;

  @override
  String toString() {
    return 'HabitRecord(habit: $habit, date: $date, isCompleted: $isCompleted, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HabitEntryImpl &&
            (identical(other.habit, habit) || other.habit == habit) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, habit, date, isCompleted, value);

  /// Create a copy of HabitRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HabitEntryImplCopyWith<_$HabitEntryImpl> get copyWith =>
      __$$HabitEntryImplCopyWithImpl<_$HabitEntryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HabitEntryImplToJson(
      this,
    );
  }
}

abstract class _HabitEntry implements HabitRecord {
  const factory _HabitEntry(
      {required final Habit habit,
      required final DateTime date,
      required final bool isCompleted,
      final double value}) = _$HabitEntryImpl;

  factory _HabitEntry.fromJson(Map<String, dynamic> json) =
      _$HabitEntryImpl.fromJson;

  @override
  Habit get habit;
  @override
  DateTime get date;
  @override
  bool get isCompleted;
  @override
  double get value;

  /// Create a copy of HabitRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HabitEntryImplCopyWith<_$HabitEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
