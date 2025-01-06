// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'habit_progress_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HabitProgressState {
  double get targetValue => throw _privateConstructorUsedError;
  double get currentValue => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  FormStatus get status => throw _privateConstructorUsedError;

  /// Create a copy of HabitProgressState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HabitProgressStateCopyWith<HabitProgressState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HabitProgressStateCopyWith<$Res> {
  factory $HabitProgressStateCopyWith(
          HabitProgressState value, $Res Function(HabitProgressState) then) =
      _$HabitProgressStateCopyWithImpl<$Res, HabitProgressState>;
  @useResult
  $Res call(
      {double targetValue,
      double currentValue,
      String id,
      DateTime date,
      FormStatus status});
}

/// @nodoc
class _$HabitProgressStateCopyWithImpl<$Res, $Val extends HabitProgressState>
    implements $HabitProgressStateCopyWith<$Res> {
  _$HabitProgressStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HabitProgressState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? targetValue = null,
    Object? currentValue = null,
    Object? id = null,
    Object? date = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      targetValue: null == targetValue
          ? _value.targetValue
          : targetValue // ignore: cast_nullable_to_non_nullable
              as double,
      currentValue: null == currentValue
          ? _value.currentValue
          : currentValue // ignore: cast_nullable_to_non_nullable
              as double,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HabitProgressStateImplCopyWith<$Res>
    implements $HabitProgressStateCopyWith<$Res> {
  factory _$$HabitProgressStateImplCopyWith(_$HabitProgressStateImpl value,
          $Res Function(_$HabitProgressStateImpl) then) =
      __$$HabitProgressStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double targetValue,
      double currentValue,
      String id,
      DateTime date,
      FormStatus status});
}

/// @nodoc
class __$$HabitProgressStateImplCopyWithImpl<$Res>
    extends _$HabitProgressStateCopyWithImpl<$Res, _$HabitProgressStateImpl>
    implements _$$HabitProgressStateImplCopyWith<$Res> {
  __$$HabitProgressStateImplCopyWithImpl(_$HabitProgressStateImpl _value,
      $Res Function(_$HabitProgressStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of HabitProgressState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? targetValue = null,
    Object? currentValue = null,
    Object? id = null,
    Object? date = null,
    Object? status = null,
  }) {
    return _then(_$HabitProgressStateImpl(
      targetValue: null == targetValue
          ? _value.targetValue
          : targetValue // ignore: cast_nullable_to_non_nullable
              as double,
      currentValue: null == currentValue
          ? _value.currentValue
          : currentValue // ignore: cast_nullable_to_non_nullable
              as double,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormStatus,
    ));
  }
}

/// @nodoc

class _$HabitProgressStateImpl implements _HabitProgressState {
  const _$HabitProgressStateImpl(
      {required this.targetValue,
      required this.currentValue,
      required this.id,
      required this.date,
      this.status = FormStatus.pure});

  @override
  final double targetValue;
  @override
  final double currentValue;
  @override
  final String id;
  @override
  final DateTime date;
  @override
  @JsonKey()
  final FormStatus status;

  @override
  String toString() {
    return 'HabitProgressState(targetValue: $targetValue, currentValue: $currentValue, id: $id, date: $date, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HabitProgressStateImpl &&
            (identical(other.targetValue, targetValue) ||
                other.targetValue == targetValue) &&
            (identical(other.currentValue, currentValue) ||
                other.currentValue == currentValue) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, targetValue, currentValue, id, date, status);

  /// Create a copy of HabitProgressState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HabitProgressStateImplCopyWith<_$HabitProgressStateImpl> get copyWith =>
      __$$HabitProgressStateImplCopyWithImpl<_$HabitProgressStateImpl>(
          this, _$identity);
}

abstract class _HabitProgressState implements HabitProgressState {
  const factory _HabitProgressState(
      {required final double targetValue,
      required final double currentValue,
      required final String id,
      required final DateTime date,
      final FormStatus status}) = _$HabitProgressStateImpl;

  @override
  double get targetValue;
  @override
  double get currentValue;
  @override
  String get id;
  @override
  DateTime get date;
  @override
  FormStatus get status;

  /// Create a copy of HabitProgressState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HabitProgressStateImplCopyWith<_$HabitProgressStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
