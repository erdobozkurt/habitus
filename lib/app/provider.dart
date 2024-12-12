import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habitus/data/repositories/habit/habit_repository.dart';
import 'package:habitus/ui/home/cubit/home_cubit.dart';

List<BlocProvider<StateStreamableSource<Object?>>> provider() {
  return [
    BlocProvider<HomeCubit>(
      create: (context) => HomeCubit(
        habitRepository: context.read<IHabitRepository>(),
      ),
    ),
  ];
}
