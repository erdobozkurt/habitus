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
  String get id => throw _privateConstructorUsedError;
  double get currentValue => throw _privateConstructorUsedError;
  double get targetValue => throw _privateConstructorUsedError;
  FormStatus get status => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

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
      {String id,
      double currentValue,
      double targetValue,
      FormStatus status,
      String? error});
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
    Object? id = null,
    Object? currentValue = null,
    Object? targetValue = null,
    Object? status = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      currentValue: null == currentValue
          ? _value.currentValue
          : currentValue // ignore: cast_nullable_to_non_nullable
              as double,
      targetValue: null == targetValue
          ? _value.targetValue
          : targetValue // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormStatus,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
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
      {String id,
      double currentValue,
      double targetValue,
      FormStatus status,
      String? error});
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
    Object? id = null,
    Object? currentValue = null,
    Object? targetValue = null,
    Object? status = null,
    Object? error = freezed,
  }) {
    return _then(_$HabitProgressStateImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      currentValue: null == currentValue
          ? _value.currentValue
          : currentValue // ignore: cast_nullable_to_non_nullable
              as double,
      targetValue: null == targetValue
          ? _value.targetValue
          : targetValue // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormStatus,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$HabitProgressStateImpl implements _HabitProgressState {
  const _$HabitProgressStateImpl(
      {required this.id,
      this.currentValue = 0.0,
      this.targetValue = 0.0,
      this.status = FormStatus.pure,
      this.error});

  @override
  final String id;
  @override
  @JsonKey()
  final double currentValue;
  @override
  @JsonKey()
  final double targetValue;
  @override
  @JsonKey()
  final FormStatus status;
  @override
  final String? error;

  @override
  String toString() {
    return 'HabitProgressState(id: $id, currentValue: $currentValue, targetValue: $targetValue, status: $status, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HabitProgressStateImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.currentValue, currentValue) ||
                other.currentValue == currentValue) &&
            (identical(other.targetValue, targetValue) ||
                other.targetValue == targetValue) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, currentValue, targetValue, status, error);

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
      {required final String id,
      final double currentValue,
      final double targetValue,
      final FormStatus status,
      final String? error}) = _$HabitProgressStateImpl;

  @override
  String get id;
  @override
  double get currentValue;
  @override
  double get targetValue;
  @override
  FormStatus get status;
  @override
  String? get error;

  /// Create a copy of HabitProgressState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HabitProgressStateImplCopyWith<_$HabitProgressStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
