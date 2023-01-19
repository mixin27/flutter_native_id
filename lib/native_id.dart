import 'native_id_platform_interface.dart';

class NativeId {
  Future<String?> getId() {
    return NativeIdPlatform.instance.getId();
  }

  Future<String?> getUUID() {
    return NativeIdPlatform.instance.getUUID();
  }
}
