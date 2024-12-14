import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme_model.freezed.dart';

enum ThemeType { light, dark, system }

@freezed
class ThemeModel with _$ThemeModel {
  const factory ThemeModel({
    @Default(ThemeType.system) ThemeType type,
  }) = _ThemeModel;
}
