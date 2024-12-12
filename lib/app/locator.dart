import 'package:flutter_bloc/flutter_bloc.dart';

Future<List<RepositoryProvider<dynamic>>> locator({
  bool isMock = false,
}) async {
  return [
    // RepositoryProvider<IHabitRepository>(
    //   create: (context) => isMock
    //       ? MockHabitRepository()
    //       : HabitRepositoryRemote(
    //           client: context.read<HttpClient>(),
    //         ),
    // ),
  ];
}
