#import "NativeIdPlugin.h"
// #import "UIDeviceSerialNumber.h"
#import <dlfcn.h>
#import <mach/port.h>
#import <mach/kern_return.h>

@implementation NativeIdPlugin
// @implementation UIDevice (serialNumber)

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"native_id"
            binaryMessenger:[registrar messenger]];
  NativeIdPlugin* instance = [[NativeIdPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getId" isEqualToString:call.method]) {
    // UIDevice *device = [UIDevice currentDevice];
    // result([[device identifierForVendor] UUIDString] ?: [NSNull null]);

    NSString *serialNumber = nil;
	
    void *IOKit = dlopen("/System/Library/Frameworks/IOKit.framework/IOKit", RTLD_NOW);
    if (IOKit)
    {
      mach_port_t *kIOMasterPortDefault = dlsym(IOKit, "kIOMasterPortDefault");
      CFMutableDictionaryRef (*IOServiceMatching)(const char *name) = dlsym(IOKit, "IOServiceMatching");
      mach_port_t (*IOServiceGetMatchingService)(mach_port_t masterPort, CFDictionaryRef matching) = dlsym(IOKit, "IOServiceGetMatchingService");
      CFTypeRef (*IORegistryEntryCreateCFProperty)(mach_port_t entry, CFStringRef key, CFAllocatorRef allocator, uint32_t options) = dlsym(IOKit, "IORegistryEntryCreateCFProperty");
      kern_return_t (*IOObjectRelease)(mach_port_t object) = dlsym(IOKit, "IOObjectRelease");
      
      if (kIOMasterPortDefault && IOServiceGetMatchingService && IORegistryEntryCreateCFProperty && IOObjectRelease)
      {
        mach_port_t platformExpertDevice = IOServiceGetMatchingService(*kIOMasterPortDefault, IOServiceMatching("IOPlatformExpertDevice"));
        if (platformExpertDevice)
        {
          CFTypeRef platformSerialNumber = IORegistryEntryCreateCFProperty(platformExpertDevice, CFSTR("IOPlatformSerialNumber"), kCFAllocatorDefault, 0);
          if (platformSerialNumber && CFGetTypeID(platformSerialNumber) == CFStringGetTypeID())
          {
            serialNumber = [NSString stringWithString:(__bridge NSString *)platformSerialNumber];
            CFRelease(platformSerialNumber);
          }
          IOObjectRelease(platformExpertDevice);
        }
      }
      dlclose(IOKit);
    }

    result(serialNumber);
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
