// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:habitus/app/locator.dart';
// import 'package:habitus/app/provider.dart';
// import 'package:habitus/app/view/app.dart';

// class AppProviders extends StatelessWidget {
//   const AppProviders({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<RepositoryProvider<dynamic>>>(
//       future: locator(),
//       builder: (context, snapshot) {
//         if (!snapshot.hasData) {
//           // Show a loading indicator while the repositories are initializing
//           return const MaterialApp(
//             home: Scaffold(
//               body: Center(child: CircularProgressIndicator()),
//             ),
//           );
//         }
//         return MultiRepositoryProvider(
//           providers: snapshot.data!,
//           child: MultiBlocProvider(
//             providers: provider(),
//             child: const App(),
//           ),
//         );
//       },
//     );
//   }
// }
