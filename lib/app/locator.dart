import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habitus/data/repositories/habit/habit_repository.dart';
import 'package:habitus/data/repositories/habit/mock_habit_repository.dart';
import 'package:habitus/data/repositories/theme/theme_repository.dart';
import 'package:habitus/data/services/local/shared_client.dart';

Future<List<RepositoryProvider<dynamic>>> locator({
  bool isMock = true,
}) async {
  final sharedClient = await SharedClient.getInstance();

  return [
    RepositoryProvider<SharedClient>(
      create: (context) => sharedClient,
    ),
    RepositoryProvider<IThemeRepository>(
      create: (context) => ThemeRepository(
        context.read<SharedClient>(),
      ),
    ),
    RepositoryProvider<IHabitRepository>(
      create: (context) => MockHabitRepository(),
    ),
  ];
}
