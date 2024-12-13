// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_habit_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CreateHabitState {
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  HabitType get habitType => throw _privateConstructorUsedError;
  FormStatus get status => throw _privateConstructorUsedError;

  /// Create a copy of CreateHabitState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CreateHabitStateCopyWith<CreateHabitState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateHabitStateCopyWith<$Res> {
  factory $CreateHabitStateCopyWith(
          CreateHabitState value, $Res Function(CreateHabitState) then) =
      _$CreateHabitStateCopyWithImpl<$Res, CreateHabitState>;
  @useResult
  $Res call(
      {String name,
      String description,
      HabitType habitType,
      FormStatus status});
}

/// @nodoc
class _$CreateHabitStateCopyWithImpl<$Res, $Val extends CreateHabitState>
    implements $CreateHabitStateCopyWith<$Res> {
  _$CreateHabitStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateHabitState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? habitType = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      habitType: null == habitType
          ? _value.habitType
          : habitType // ignore: cast_nullable_to_non_nullable
              as HabitType,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreateHabitStateImplCopyWith<$Res>
    implements $CreateHabitStateCopyWith<$Res> {
  factory _$$CreateHabitStateImplCopyWith(_$CreateHabitStateImpl value,
          $Res Function(_$CreateHabitStateImpl) then) =
      __$$CreateHabitStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String description,
      HabitType habitType,
      FormStatus status});
}

/// @nodoc
class __$$CreateHabitStateImplCopyWithImpl<$Res>
    extends _$CreateHabitStateCopyWithImpl<$Res, _$CreateHabitStateImpl>
    implements _$$CreateHabitStateImplCopyWith<$Res> {
  __$$CreateHabitStateImplCopyWithImpl(_$CreateHabitStateImpl _value,
      $Res Function(_$CreateHabitStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CreateHabitState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? habitType = null,
    Object? status = null,
  }) {
    return _then(_$CreateHabitStateImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      habitType: null == habitType
          ? _value.habitType
          : habitType // ignore: cast_nullable_to_non_nullable
              as HabitType,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormStatus,
    ));
  }
}

/// @nodoc

class _$CreateHabitStateImpl implements _CreateHabitState {
  const _$CreateHabitStateImpl(
      {this.name = '',
      this.description = '',
      this.habitType = HabitType.boolean,
      this.status = FormStatus.pure});

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final HabitType habitType;
  @override
  @JsonKey()
  final FormStatus status;

  @override
  String toString() {
    return 'CreateHabitState(name: $name, description: $description, habitType: $habitType, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateHabitStateImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.habitType, habitType) ||
                other.habitType == habitType) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, name, description, habitType, status);

  /// Create a copy of CreateHabitState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateHabitStateImplCopyWith<_$CreateHabitStateImpl> get copyWith =>
      __$$CreateHabitStateImplCopyWithImpl<_$CreateHabitStateImpl>(
          this, _$identity);
}

abstract class _CreateHabitState implements CreateHabitState {
  const factory _CreateHabitState(
      {final String name,
      final String description,
      final HabitType habitType,
      final FormStatus status}) = _$CreateHabitStateImpl;

  @override
  String get name;
  @override
  String get description;
  @override
  HabitType get habitType;
  @override
  FormStatus get status;

  /// Create a copy of CreateHabitState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateHabitStateImplCopyWith<_$CreateHabitStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
