import UIKit
import Flutter
import FirebaseCore
import Firebase
import FirebaseMessaging
import flutter_local_notifications

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    FirebaseApp.configure()
    // GMSServices.provideAPIKey("AIzaSyAcra8Dw_HGUj9zhcI6uRiHSCvfia8lqM4")
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
  override func application (_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken:Data){
    Messaging.messaging().apnsToken = deviceToken
    super.application(application, didRegisterForRemoteNotificationsWithDeviceToken: deviceToken)
  }
}
