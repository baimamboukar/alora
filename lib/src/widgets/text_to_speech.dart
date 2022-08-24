import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

import '../configs/palette.dart';
import '../configs/styles.dart';
import '../services/tts/text_to_speech_services.dart';

class TextToSpeech extends ConsumerWidget {
  final String text;
  final String lang;
  const TextToSpeech({
    Key? key,
    required this.text,
    required this.lang,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Lottie.asset("assets/images/play.json", height: 70, width: 70),
        GestureDetector(
          onTap: () async {
            final tts =
                await TextToSpeechServices(ref.read).configure(locale: lang);
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
}
