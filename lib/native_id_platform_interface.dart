import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'native_id_method_channel.dart';

abstract class NativeIdPlatform extends PlatformInterface {
  /// Constructs a NativeIdPlatform.
  NativeIdPlatform() : super(token: _token);

  static final Object _token = Object();

  static NativeIdPlatform _instance = MethodChannelNativeId();

  /// The default instance of [NativeIdPlatform] to use.
  ///
  /// Defaults to [MethodChannelNativeId].
  static NativeIdPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [NativeIdPlatform] when
  /// they register themselves.
  static set instance(NativeIdPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  /// Get unique identifier.
  Future<String?> getId() {
    throw UnimplementedError('getId() has not been implemented.');
  }

  /// Get `uuid`.
  Future<String?> getUUID() {
    throw UnimplementedError('getUUID() has not been implemented.');
  }
}
