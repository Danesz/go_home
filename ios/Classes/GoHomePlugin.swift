import Flutter
import UIKit

public class GoHomePlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "go_home", binaryMessenger: registrar.messenger())
    let instance = GoHomePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "sendAppToHome":
      UIApplication.shared.perform(#selector(NSXPCConnection.suspend))
      result(true)
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
