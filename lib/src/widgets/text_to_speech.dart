import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

import '../configs/palette.dart';
import '../configs/styles.dart';
import '../services/tts/text_to_speech_services.dart';

class TextToSpeech extends ConsumerWidget {
  final String text;
  final String lang;
  final VoidCallback? callback;
  const TextToSpeech({
    Key? key,
    this.callback,
    required this.text,
    required this.lang,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Lottie.asset("assets/images/play.json", height: 70, width: 70),
        GestureDetector(
          onTap: callback ??
              () async {
                final tts = await TextToSpeechServices(ref.read)
                    .configure(locale: lang);
                tts.speak(text);
              },
          child: Column(
            children: [
              Text("Play sound",
                  style: Styles.designText(
                      bold: true, color: Palette.dark, size: 16)),
              Text("Listen to the text",
                  style: Styles.designText(
                      bold: false, color: Palette.dark, size: 10)),
            ],
          ),
        ),
        const Spacer(),
        Lottie.asset(
          "assets/images/audio.json",
          height: 70,
        ),
      ],
    );
  }

  factory TextToSpeech.forSteps(
      List<String> steps, String lang, WidgetRef ref) {
    return TextToSpeech(
      text: steps.first,
      lang: lang,
      callback: () async {
        final tts =
            await TextToSpeechServices(ref.read).configure(locale: lang);
        tts.setVoice({"name": "en-AU-language", "locale": "en-AU"});
        StringBuffer buffer = StringBuffer();
        for (var i = 0; i < steps.length; i++) {
          buffer.write("step $i");
          buffer.write(steps[i]);
          buffer.write("\n ");
        }
        var voices = await tts.getVoices;
        print(voices);
        //  tts.speak(buffer.toString());
      },
    );
  }
}
