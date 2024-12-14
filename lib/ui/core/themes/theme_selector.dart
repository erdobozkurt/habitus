import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habitus/domain/models/theme/theme_model.dart';
import 'package:habitus/ui/core/themes/cubit/theme_cubit.dart';
import 'package:habitus/utils/extensions/context_extension.dart';

class ThemeSelector extends StatelessWidget {
  const ThemeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        final isDarkMode = state.themeType == ThemeType.dark;

        return PopupMenuButton<int>(
          icon: const Icon(Icons.settings_outlined),
          itemBuilder: (context) => [
            PopupMenuItem<int>(
              enabled: false,
              child: StatefulBuilder(
                builder: (context, setState) {
                  return CheckboxListTile(
                    title:
                        Text('Dark mode', style: context.textTheme.bodyMedium),
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
          ],
        );
      },
    );
  }
}
