// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboard_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OnboardState {
  bool get isOnboarded => throw _privateConstructorUsedError;
  bool get isChecked => throw _privateConstructorUsedError;

  /// Create a copy of OnboardState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OnboardStateCopyWith<OnboardState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnboardStateCopyWith<$Res> {
  factory $OnboardStateCopyWith(
          OnboardState value, $Res Function(OnboardState) then) =
      _$OnboardStateCopyWithImpl<$Res, OnboardState>;
  @useResult
  $Res call({bool isOnboarded, bool isChecked});
}

/// @nodoc
class _$OnboardStateCopyWithImpl<$Res, $Val extends OnboardState>
    implements $OnboardStateCopyWith<$Res> {
  _$OnboardStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OnboardState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isOnboarded = null,
    Object? isChecked = null,
  }) {
    return _then(_value.copyWith(
      isOnboarded: null == isOnboarded
          ? _value.isOnboarded
          : isOnboarded // ignore: cast_nullable_to_non_nullable
              as bool,
      isChecked: null == isChecked
          ? _value.isChecked
          : isChecked // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OnboardStateImplCopyWith<$Res>
    implements $OnboardStateCopyWith<$Res> {
  factory _$$OnboardStateImplCopyWith(
          _$OnboardStateImpl value, $Res Function(_$OnboardStateImpl) then) =
      __$$OnboardStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isOnboarded, bool isChecked});
}

/// @nodoc
class __$$OnboardStateImplCopyWithImpl<$Res>
    extends _$OnboardStateCopyWithImpl<$Res, _$OnboardStateImpl>
    implements _$$OnboardStateImplCopyWith<$Res> {
  __$$OnboardStateImplCopyWithImpl(
      _$OnboardStateImpl _value, $Res Function(_$OnboardStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of OnboardState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isOnboarded = null,
    Object? isChecked = null,
  }) {
    return _then(_$OnboardStateImpl(
      isOnboarded: null == isOnboarded
          ? _value.isOnboarded
          : isOnboarded // ignore: cast_nullable_to_non_nullable
              as bool,
      isChecked: null == isChecked
          ? _value.isChecked
          : isChecked // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$OnboardStateImpl implements _OnboardState {
  const _$OnboardStateImpl({this.isOnboarded = false, this.isChecked = false});

  @override
  @JsonKey()
  final bool isOnboarded;
  @override
  @JsonKey()
  final bool isChecked;

  @override
  String toString() {
    return 'OnboardState(isOnboarded: $isOnboarded, isChecked: $isChecked)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnboardStateImpl &&
            (identical(other.isOnboarded, isOnboarded) ||
                other.isOnboarded == isOnboarded) &&
            (identical(other.isChecked, isChecked) ||
                other.isChecked == isChecked));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isOnboarded, isChecked);

  /// Create a copy of OnboardState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OnboardStateImplCopyWith<_$OnboardStateImpl> get copyWith =>
      __$$OnboardStateImplCopyWithImpl<_$OnboardStateImpl>(this, _$identity);
}

abstract class _OnboardState implements OnboardState {
  const factory _OnboardState({final bool isOnboarded, final bool isChecked}) =
      _$OnboardStateImpl;

  @override
  bool get isOnboarded;
  @override
  bool get isChecked;

  /// Create a copy of OnboardState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OnboardStateImplCopyWith<_$OnboardStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
