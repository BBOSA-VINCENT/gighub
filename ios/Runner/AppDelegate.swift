import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    GMSServices.provideKey("AIzaSyCFYLTn3yXVtwJIW_O2rzBHJhgikKE0zYU")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
