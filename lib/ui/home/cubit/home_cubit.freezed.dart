// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeState {
  List<Habit> get habits => throw _privateConstructorUsedError;
  List<HabitRecord> get habitRecords => throw _privateConstructorUsedError;
  Status get status => throw _privateConstructorUsedError;
  Status get toggleStatus => throw _privateConstructorUsedError;
  DateTime? get selectedDate => throw _privateConstructorUsedError;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call(
      {List<Habit> habits,
      List<HabitRecord> habitRecords,
      Status status,
      Status toggleStatus,
      DateTime? selectedDate});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? habits = null,
    Object? habitRecords = null,
    Object? status = null,
    Object? toggleStatus = null,
    Object? selectedDate = freezed,
  }) {
    return _then(_value.copyWith(
      habits: null == habits
          ? _value.habits
          : habits // ignore: cast_nullable_to_non_nullable
              as List<Habit>,
      habitRecords: null == habitRecords
          ? _value.habitRecords
          : habitRecords // ignore: cast_nullable_to_non_nullable
              as List<HabitRecord>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      toggleStatus: null == toggleStatus
          ? _value.toggleStatus
          : toggleStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      selectedDate: freezed == selectedDate
          ? _value.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeStateImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$HomeStateImplCopyWith(
          _$HomeStateImpl value, $Res Function(_$HomeStateImpl) then) =
      __$$HomeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Habit> habits,
      List<HabitRecord> habitRecords,
      Status status,
      Status toggleStatus,
      DateTime? selectedDate});
}

/// @nodoc
class __$$HomeStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateImpl>
    implements _$$HomeStateImplCopyWith<$Res> {
  __$$HomeStateImplCopyWithImpl(
      _$HomeStateImpl _value, $Res Function(_$HomeStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? habits = null,
    Object? habitRecords = null,
    Object? status = null,
    Object? toggleStatus = null,
    Object? selectedDate = freezed,
  }) {
    return _then(_$HomeStateImpl(
      habits: null == habits
          ? _value._habits
          : habits // ignore: cast_nullable_to_non_nullable
              as List<Habit>,
      habitRecords: null == habitRecords
          ? _value._habitRecords
          : habitRecords // ignore: cast_nullable_to_non_nullable
              as List<HabitRecord>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      toggleStatus: null == toggleStatus
          ? _value.toggleStatus
          : toggleStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      selectedDate: freezed == selectedDate
          ? _value.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$HomeStateImpl implements _HomeState {
  const _$HomeStateImpl(
      {final List<Habit> habits = const [],
      final List<HabitRecord> habitRecords = const [],
      this.status = Status.initial,
      this.toggleStatus = Status.initial,
      this.selectedDate})
      : _habits = habits,
        _habitRecords = habitRecords;

  final List<Habit> _habits;
  @override
  @JsonKey()
  List<Habit> get habits {
    if (_habits is EqualUnmodifiableListView) return _habits;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_habits);
  }

  final List<HabitRecord> _habitRecords;
  @override
  @JsonKey()
  List<HabitRecord> get habitRecords {
    if (_habitRecords is EqualUnmodifiableListView) return _habitRecords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_habitRecords);
  }

  @override
  @JsonKey()
  final Status status;
  @override
  @JsonKey()
  final Status toggleStatus;
  @override
  final DateTime? selectedDate;

  @override
  String toString() {
    return 'HomeState(habits: $habits, habitRecords: $habitRecords, status: $status, toggleStatus: $toggleStatus, selectedDate: $selectedDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateImpl &&
            const DeepCollectionEquality().equals(other._habits, _habits) &&
            const DeepCollectionEquality()
                .equals(other._habitRecords, _habitRecords) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.toggleStatus, toggleStatus) ||
                other.toggleStatus == toggleStatus) &&
            (identical(other.selectedDate, selectedDate) ||
                other.selectedDate == selectedDate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_habits),
      const DeepCollectionEquality().hash(_habitRecords),
      status,
      toggleStatus,
      selectedDate);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      __$$HomeStateImplCopyWithImpl<_$HomeStateImpl>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  const factory _HomeState(
      {final List<Habit> habits,
      final List<HabitRecord> habitRecords,
      final Status status,
      final Status toggleStatus,
      final DateTime? selectedDate}) = _$HomeStateImpl;

  @override
  List<Habit> get habits;
  @override
  List<HabitRecord> get habitRecords;
  @override
  Status get status;
  @override
  Status get toggleStatus;
  @override
  DateTime? get selectedDate;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
