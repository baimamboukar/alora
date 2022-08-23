import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tts/flutter_tts.dart';

class TextToSpeechServices {
  // ignore: unused_field
  final Reader _read;
  TextToSpeechServices(this._read);
  FlutterTts tts = FlutterTts();
  Future<FlutterTts> configure({required String locale, double? volume}) async {
    await tts.setQueueMode(2);
    await tts.setVolume(volume ?? 1.0);

    await tts.setLanguage(locale);
    return tts;
  }
}
