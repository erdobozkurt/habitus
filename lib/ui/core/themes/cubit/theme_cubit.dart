import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:habitus/data/repositories/theme/theme_repository.dart';
import 'package:habitus/domain/models/theme/theme_model.dart';

part 'theme_cubit.freezed.dart';
part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit({required IThemeRepository themeRepository})
      : _themeRepository = themeRepository,
        super(const ThemeState()) {
    _loadTheme();
  }

  final IThemeRepository _themeRepository;

  Future<void> _loadTheme() async {
    final themeString = await _themeRepository.getTheme();
    if (themeString != null) {
      final themeType = ThemeType.values.firstWhere(
        (e) => e.toString() == themeString,
        orElse: () => ThemeType.system,
      );
      emit(state.copyWith(themeType: themeType));
    }
  }

  Future<void> setTheme(ThemeType theme) async {
    await _themeRepository.setTheme(theme.toString());
    emit(state.copyWith(themeType: theme));
  }
}
