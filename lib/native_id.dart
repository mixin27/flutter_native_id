import 'native_id_platform_interface.dart';

class NativeId {
  /// Get unique identifier.
  Future<String?> getId() {
    return NativeIdPlatform.instance.getId();
  }

  /// Get `uuid`.
  Future<String?> getUUID() {
    return NativeIdPlatform.instance.getUUID();
  }
}
