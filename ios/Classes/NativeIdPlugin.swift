import Flutter
import UIKit

public class NativeIdPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "native_id", binaryMessenger: registrar.messenger())
    let instance = NativeIdPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getId":
      let identifierForVendor = UIDevice.current.identifierForVendor?.uuidString
      result(identifierForVendor)
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
