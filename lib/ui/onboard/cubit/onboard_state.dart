import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboard_state.freezed.dart';

@freezed
class OnboardState with _$OnboardState {
  const factory OnboardState({
    @Default(false) bool isOnboarded,
    @Default(false) bool isChecked,
  }) = _OnboardState;
}
