import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
          let dictionaryChannel = FlutterMethodChannel(name: "samples.flutter.dev/dictionary",
                                                       binaryMessenger: controller.binaryMessenger)
            dictionaryChannel.setMethodCallHandler({
              [weak self] (call: FlutterMethodCall, result: FlutterResult) -> Void in
              // This method is invoked on the UI thread.
                guard call.method == "searchDictionary" else {
                    result(FlutterMethodNotImplemented)
                    return
                  }
                let args = call.arguments as? [String: Any]
                let word = args?["word"] as? String
                self?.searchDictionary(result: result,controller: controller,queryWord: word!)
            })
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    private func searchDictionary(result: FlutterResult, controller: FlutterViewController, queryWord: String){
        let ref: UIReferenceLibraryViewController = UIReferenceLibraryViewController(term: queryWord)
        controller.present(ref, animated: true, completion: nil)
}
}
