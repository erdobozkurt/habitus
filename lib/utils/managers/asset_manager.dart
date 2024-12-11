// lib/core/managers/asset_manager.dart

import 'package:habitus/core/constants/asset_constants.dart';

class AssetsManager {
  AssetsManager._();
  static final AssetsManager _instance = AssetsManager._();
  static AssetsManager get instance => _instance;

  // App Logo
  String get appLogo => AssetConstants.appLogo;

  // Onboarding
  String get createRoutineImage => AssetConstants.createRoutineImage;
  String get editRoutineImage => AssetConstants.editRoutineImage;
  String get trackProgressImage => AssetConstants.trackProgressImage;

  // Helper method to validate asset existence
  bool hasAsset(String asset) {
    if (asset == createRoutineImage) return true;
    if (asset == editRoutineImage) return true;
    if (asset == trackProgressImage) {
      return true;
    } else {
      return false;
    }
  }
}
