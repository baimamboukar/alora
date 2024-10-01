import 'package:flutter_tts/flutter_tts.dart';

class TextToSpeechServices {
  // ignore: unused_field
  //final Reader _read;
  TextToSpeechServices();

  Future<FlutterTts> configure({required String locale, double? volume}) async {
    FlutterTts tts = FlutterTts();
    await tts.setPitch(1);
    await tts.setSpeechRate(.35);
    await tts.setVoice({"name": "en-AU-language", "locale": locale});
    await tts.setVolume(volume ?? 1.0);
    await tts.setLanguage("en-AU");
    return tts;
  }

  // Get singleton instance of FlutterTts
  FlutterTts? _tts;

  Future<FlutterTts> getTts() async {
    _tts ??= await configure(locale: "en-AU", volume: 1.0);
    return _tts!;
  }
}

class Reader {}
