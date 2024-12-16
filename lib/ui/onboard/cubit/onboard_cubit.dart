import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habitus/data/repositories/onboard/onboard_repository.dart';
import 'package:habitus/ui/onboard/cubit/onboard_state.dart';

class OnboardCubit extends Cubit<OnboardState> {
  OnboardCubit({
    required IOnboardRepository onboardRepository,
  })  : _onboardRepository = onboardRepository,
        super(const OnboardState());

  final IOnboardRepository _onboardRepository;

  Future<void> checkOnboardStatus() async {
    final isOnboarded = await _onboardRepository.isOnboarded;
    emit(
      state.copyWith(
        isOnboarded: isOnboarded,
        isChecked: true,
      ),
    );
    log('Onboard status checked: $isOnboarded');
  }

  Future<void> setOnboarded() async {
    await _onboardRepository.setOnboarded();
    emit(
      state.copyWith(
        isOnboarded: true,
        isChecked: true,
      ),
    );
  }

  Future<void> setNotOnboarded() async {
    await _onboardRepository.setNotOnboarded();
    emit(
      state.copyWith(
        isOnboarded: false,
        isChecked: true,
      ),
    );
  }
}
