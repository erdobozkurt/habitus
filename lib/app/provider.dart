import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habitus/data/repositories/habit/habit_repository.dart';
import 'package:habitus/data/repositories/onboard/onboard_repository.dart';
import 'package:habitus/data/repositories/theme/theme_repository.dart';
import 'package:habitus/ui/core/themes/cubit/theme_cubit.dart';
import 'package:habitus/ui/create_habit/cubit/create_habit_cubit.dart';
import 'package:habitus/ui/dashboard/cubit/dashboard_cubit.dart';
import 'package:habitus/ui/home/cubit/home_cubit.dart';
import 'package:habitus/ui/onboard/cubit/onboard_cubit.dart';

List<BlocProvider<StateStreamableSource<Object?>>> provider() {
  return [
    BlocProvider<ThemeCubit>(
      create: (context) => ThemeCubit(
        themeRepository: context.read<IThemeRepository>()..getTheme(),
      ),
    ),
    BlocProvider<OnboardCubit>(
      create: (context) => OnboardCubit(
        onboardRepository: context.read<IOnboardRepository>(),
      ),
    ),
    BlocProvider<HomeCubit>(
      create: (context) => HomeCubit(
        habitRepository: context.read<IHabitRepository>(),
      ),
    ),
    BlocProvider<CreateHabitCubit>(
      create: (context) => CreateHabitCubit(
        habitRepository: context.read<IHabitRepository>(),
      ),
    ),
    BlocProvider<DashboardCubit>(
      create: (context) => DashboardCubit(
        context.read<IHabitRepository>(),
      )..fetchHabits(),
    ),
  ];
}
