import Flutter
import UIKit

public class SwiftNativeIdPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "native_id", binaryMessenger: registrar.messenger())
    let instance = SwiftDeviceInformationPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if(call.method.elementsEqual("getId")){
      let id = UIDevice.current.identifierForVendor?.uuidString
        result(id)
    }
  }
}