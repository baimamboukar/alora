import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tts/flutter_tts_web.dart';

class TextToSpeechServices {
  final Reader _read;
  TextToSpeechServices(this._read);
  FlutterTtsPlugin tts = FlutterTtsPlugin();
  Future<FlutterTtsPlugin> configure(
      {required String locale, double? volume}) async {
    return tts;
  }
}
