#import "NativeIdPlugin.h"

@implementation NativeIdPlugin

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"native_id"
            binaryMessenger:[registrar messenger]];
  NativeIdPlugin* instance = [[NativeIdPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getId" isEqualToString:call.method]) {
    UIDevice *device = [UIDevice currentDevice];
    result([[device identifierForVendor] UUIDString] ?: [NSNull null]);
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
