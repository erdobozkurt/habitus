import 'package:flutter/material.dart';
import 'package:habitus/l10n/l10n.dart';
import 'package:habitus/router/app_router.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        useMaterial3: true,
        extensions: const <ThemeExtension>[
          WoltModalSheetThemeData(
            mainContentScrollPhysics: ClampingScrollPhysics(),
          ),
        ],
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: AppRouter.router,
    );
  }
}
