# NativeId Plugin (Android, iOS)

Get current device unique id from within the flutter application.

> **Warning:** In `android`, this plugin use the `ANDROID_ID` that can be change by user for the rooted device.

## Usage

Import `import 'package:native_id/native_id.dart';`, instantiate `NativeId` and use the `getId()` or `getUUID()` methods.

Example:

```dart
Future<String> getNativeId() async {
    final nativeIdPlugin = NativeId();
    try {
      final nativeId = await nativeIdPlugin.getId();
      return nativeId ?? 'Unknown native id';
    } on PlatformException {
      return 'Failed to get nativeId';
    }
}
```
