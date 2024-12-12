import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:habitus/data/repositories/habit/habit_repository.dart';
import 'package:habitus/domain/enums/status.dart';
import 'package:habitus/domain/models/habit/habit_model.dart';

part 'home_cubit.freezed.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required IHabitRepository habitRepository,
  })  : _habitRepository = habitRepository,
        super(const HomeState());

  final IHabitRepository _habitRepository;

  Future<void> getHabits() async {
    emit(state.copyWith(status: Status.loading));
    try {
      final habits = await _habitRepository.getHabits();
      emit(state.copyWith(status: Status.loaded, habits: habits));
    } catch (e) {
      emit(state.copyWith(status: Status.error));
    }
  }
}
