import 'package:habitus/data/services/local/shared_client.dart';

abstract class IOnboardRepository {
  Future<bool> get isOnboarded;
  Future<void> setOnboarded();
  Future<void> setNotOnboarded();
}

class OnboardRepository implements IOnboardRepository {
  OnboardRepository(this._sharedClient);
  final SharedClient _sharedClient;

  @override
  Future<bool> get isOnboarded async {
    return _sharedClient.readBool(SharedKeys.isOnboarded) ?? false;
  }

  @override
  Future<void> setOnboarded() async {
    await _sharedClient.writeBool(SharedKeys.isOnboarded, value: true);
  }

  @override
  Future<void> setNotOnboarded() async {
    await _sharedClient.writeBool(SharedKeys.isOnboarded, value: false);
  }
}
