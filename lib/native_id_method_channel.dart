import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'native_id_platform_interface.dart';

/// An implementation of [NativeIdPlatform] that uses method channels.
class MethodChannelNativeId extends NativeIdPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('native_id');

  @override
  Future<String?> getId() async {
    final androidId = await methodChannel.invokeMethod<String>('getId');
    return androidId;
  }

  @override
  Future<String?> getUUID() async {
    if (Platform.isAndroid) {
      return await methodChannel.invokeMethod<String>('getUUID');
    } else if (Platform.isIOS) {
      return await methodChannel.invokeMethod<String>('getId');
    } else {
      return null;
    }
  }

  // @override
  // Future<String?> getPlatformVersion() async {
  //   final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
  //   return version;
  // }
}
