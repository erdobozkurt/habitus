import 'package:habitus/data/services/local/shared_client.dart';

abstract class IThemeRepository {
  Future<String?> getTheme();
  Future<void> setTheme(String theme);
}

class ThemeRepository implements IThemeRepository {
  ThemeRepository(this._sharedClient);
  final SharedClient _sharedClient;

  @override
  Future<String?> getTheme() async {
    return _sharedClient.readString(SharedKeys.theme);
  }

  @override
  Future<void> setTheme(String theme) async {
    await _sharedClient.writeString(SharedKeys.theme, theme);
  }
}
