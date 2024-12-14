import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habitus/data/repositories/habit/habit_repository.dart';
import 'package:habitus/data/repositories/habit/mock_habit_repository.dart';

Future<List<RepositoryProvider<dynamic>>> locator({
  bool isMock = true,
}) async {
  return [
    RepositoryProvider<IHabitRepository>(
      create: (context) => MockHabitRepository(),
    ),
  ];
}
