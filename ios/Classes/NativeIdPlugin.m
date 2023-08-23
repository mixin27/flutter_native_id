#import "NativeIdPlugin.h"
#if __has_include(<native_id/native_id-Swift.h>)
#import <native_id/native_id-Swift.h>
#else
#import "native_id-Swift.h"
#endif

@implementation NativeIdPlugin

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftNativeIdPlugin registerWithRegistrar:registrar];
}

@end
