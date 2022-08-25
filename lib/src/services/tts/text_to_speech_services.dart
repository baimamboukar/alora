import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tts/flutter_tts.dart';

class TextToSpeechServices {
  // ignore: unused_field
  final Reader _read;
  TextToSpeechServices(this._read);

  Future<FlutterTts> configure({required String locale, double? volume}) async {
    FlutterTts tts = FlutterTts();
    await tts.setPitch(1);
    await tts.setSpeechRate(.35);
    await tts.setVoice({"name": "en-AU-language", "locale": "en-AU"});
    await tts.setVolume(volume ?? 1.0);
    await tts.setLanguage("en-AU");
    return tts;
  }
}
