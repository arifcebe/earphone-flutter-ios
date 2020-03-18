import 'dart:async';

import 'package:flutter/services.dart';

class Brisikmen {
  static const MethodChannel _channel =
      const MethodChannel('brisikmen');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
  
  static Future<String> get playAudioCalling async {
    final String resultFromAudio = await _channel.invokeMethod('callAudio');
    return resultFromAudio;
  }
}
