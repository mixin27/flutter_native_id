import 'native_id_platform_interface.dart';

/// [NativeId] plugin to get `unique identifier` on `Android` and `iOS`
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
