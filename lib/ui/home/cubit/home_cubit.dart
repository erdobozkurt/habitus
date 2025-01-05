import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:habitus/data/repositories/habit/habit_repository.dart';
import 'package:habitus/domain/enums/status.dart';
import 'package:habitus/domain/models/habit/habit_model.dart';
import 'package:habitus/ui/create_habit/cubit/create_habit_cubit.dart';

part 'home_cubit.freezed.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required IHabitRepository habitRepository,
  })  : _habitRepository = habitRepository,
        super(const HomeState());

  final IHabitRepository _habitRepository;

  Future<void> getHabits({bool isRefetch = false}) async {
    isRefetch
        ? emit(
            state.copyWith(
              toggleStatus: Status.loading,
            ),
          )
        : emit(
            state.copyWith(
              status: Status.loading,
            ),
          );
    try {
      final habits = await _habitRepository.getHabits();
      isRefetch
          ? emit(
              state.copyWith(
                habits: habits,
                toggleStatus: Status.loaded,
              ),
            )
          : emit(
              state.copyWith(
                habits: habits,
                status: Status.loaded,
              ),
            );
    } catch (e) {
      isRefetch
          ? emit(
              state.copyWith(
                toggleStatus: Status.error,
              ),
            )
          : emit(
              state.copyWith(
                status: Status.error,
              ),
            );
    }
  }

  Future<void> toggleHabit(
    String id, {
    required bool completed,
    bool isRefetch = false,
  }) async {
    try {
      final habit = state.habits.firstWhere((h) => h.id == id);
      final updatedHabit = habit.type == HabitType.boolean
          ? habit.copyWith(isCompleted: completed)
          : null;
      await _habitRepository.updateHabit(updatedHabit ?? habit);
      await getHabits(isRefetch: true);
    } catch (e) {
      emit(
        state.copyWith(
          status: Status.error,
        ),
      );
    }
  }
}
