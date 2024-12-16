import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:habitus/domain/models/theme/theme_model.dart';
import 'package:habitus/router/route_constants.dart';
import 'package:habitus/ui/core/themes/cubit/theme_cubit.dart';
import 'package:habitus/ui/onboard/cubit/onboard_cubit.dart';
import 'package:habitus/utils/extensions/context_extension.dart';

class AppBarSettings extends StatelessWidget {
  const AppBarSettings({super.key});

  @override
  Widget build(BuildContext context) {
    final onoboardCubit = context.read<OnboardCubit>();
    final isDarkMode = context
        .select((ThemeCubit cubit) => cubit.state.themeType == ThemeType.dark);
    return PopupMenuButton<int>(
      icon: const Icon(Icons.settings_outlined),
      itemBuilder: (context) => [
        PopupMenuItem<int>(
          enabled: false,
          child: StatefulBuilder(
            builder: (context, setState) {
              return CheckboxListTile(
                title: Text('Dark mode', style: context.textTheme.bodyMedium),
                value: isDarkMode,
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      context.read<ThemeCubit>().setTheme(
                            value ? ThemeType.dark : ThemeType.light,
                          );
                    });
                    Navigator.pop(context);
                  }
                },
              );
            },
          ),
        ),
        PopupMenuItem<int>(
          child: ListTile(
            title: Text('Show onboarding', style: context.textTheme.bodyMedium),
            onTap: () async {
              context.pop();
              await onoboardCubit.setNotOnboarded().then((_) {
                // ignore: use_build_context_synchronously
                context.go(RouteConstants.onboarding);
              });
            },
          ),
        ),
      ],
    );
  }
}
