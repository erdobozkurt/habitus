import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habitus/domain/models/theme/theme_model.dart';
import 'package:habitus/l10n/l10n.dart';
import 'package:habitus/router/app_router.dart';
import 'package:habitus/ui/core/themes/cubit/theme_cubit.dart';
import 'package:habitus/ui/core/themes/theme.dart';
import 'package:habitus/ui/core/themes/util.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final themeState = context.watch<ThemeCubit>().state;
    final textTheme = createTextTheme(context, 'Inter', 'Poppins');
    final theme = MaterialTheme(textTheme);

    return MaterialApp.router(
      theme: theme.light(),
      darkTheme: theme.dark(),
      themeMode: _getThemeMode(themeState.themeType),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: AppRouter.router,
    );
  }

  ThemeMode _getThemeMode(ThemeType type) {
    switch (type) {
      case ThemeType.light:
        return ThemeMode.light;
      case ThemeType.dark:
        return ThemeMode.dark;
      case ThemeType.system:
        return ThemeMode.system;
    }
  }
}
