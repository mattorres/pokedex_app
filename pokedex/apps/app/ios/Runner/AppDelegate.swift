import UIKit
import Flutter
import AVFoundation

@main
@objc class AppDelegate: FlutterAppDelegate {
    
    private let channelName = "pokemon_tts"
    private var speechSynthesizer = AVSpeechSynthesizer()

    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        
        let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
        let ttsChannel = FlutterMethodChannel(name: channelName, binaryMessenger: controller.binaryMessenger)

        ttsChannel.setMethodCallHandler { (call: FlutterMethodCall, result: FlutterResult) in
            if call.method == "speak" {
                if let args = call.arguments as? [String: Any],
                   let name = args["name"] as? String {
                    self.speak(text: name)
                    result(nil)
                } else {
                    result(FlutterError(code: "INVALID_ARGUMENT", message: "Nome do Pokémon ausente", details: nil))
                }
            } else {
                result(FlutterMethodNotImplemented)
            }
        }

        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }

    private func speak(text: String) {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US") // ou "pt-BR" se quiser
        speechSynthesizer.speak(utterance)
    }
}
