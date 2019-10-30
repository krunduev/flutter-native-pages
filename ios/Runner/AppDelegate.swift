import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    
    let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
    
       let newController = FlutterMethodChannel(name: "curiousit.eu/page_curl",
                                                 binaryMessenger: controller.binaryMessenger)
       newController.setMethodCallHandler({
         [weak self] (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
         // Note: this method is invoked on the UI thread.
         // Handle battery messages.
        guard call.method == "openNewPage" else {
           result(FlutterMethodNotImplemented)
           return
         }
         self?.myNavigate()
        
        
       })
    
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
    func myNavigate() -> Void {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "SecondController") as! SecondController
                
       let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
        
        controller.present(newViewController, animated: true, completion: nil)
    }
  
}
