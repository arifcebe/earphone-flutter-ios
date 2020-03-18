import Flutter
import UIKit
import AVFoundation

public class SwiftBrisikmenPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "brisikmen", binaryMessenger: registrar.messenger())
    let instance = SwiftBrisikmenPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    //result("iOS " + UIDevice.current.systemVersion)
    
    switch call.method {
    case "getPlatformVersion":
        result("iOS " + UIDevice.current.systemVersion)
        break
    case "callAudio":
        playAudioCalling(result: result)
        break
    default:
        break
    }
  }

    var audioPlayer: AVAudioPlayer = AVAudioPlayer()
    private func playAudioCalling(result: FlutterResult){
        guard let path: String = Bundle.main.path(forResource: "klakson", ofType: "mp3") else {
            return
        }
        let url: URL = URL(fileURLWithPath: path)
        //result("current path \(path)")
        do {
            
            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playAndRecord)
            try AVAudioSession.sharedInstance().setActive(true)
            
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer.prepareToPlay()
            audioPlayer.play()
            result("Berhasil play")
        } catch {
            result("Error play sound")
        }
    }
  
}
