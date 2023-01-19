// import 'package:flutter_test/flutter_test.dart';
// import 'package:native_id/native_id.dart';
// import 'package:native_id/native_id_platform_interface.dart';
// import 'package:native_id/native_id_method_channel.dart';
// import 'package:plugin_platform_interface/plugin_platform_interface.dart';

// class MockNativeIdPlatform
//     with MockPlatformInterfaceMixin
//     implements NativeIdPlatform {

//   @override
//   Future<String?> getPlatformVersion() => Future.value('42');
// }

// void main() {
//   final NativeIdPlatform initialPlatform = NativeIdPlatform.instance;

//   test('$MethodChannelNativeId is the default instance', () {
//     expect(initialPlatform, isInstanceOf<MethodChannelNativeId>());
//   });

//   test('getPlatformVersion', () async {
//     NativeId nativeIdPlugin = NativeId();
//     MockNativeIdPlatform fakePlatform = MockNativeIdPlatform();
//     NativeIdPlatform.instance = fakePlatform;

//     expect(await nativeIdPlugin.getPlatformVersion(), '42');
//   });
// }
