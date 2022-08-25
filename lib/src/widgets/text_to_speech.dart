import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

import '../configs/palette.dart';
import '../configs/styles.dart';
import '../services/tts/text_to_speech_services.dart';

final isPlayingRiverpod = StateProvider<bool>((ref) => false);

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
    final isPlaying = ref.watch(isPlayingRiverpod.state).state;
    return Row(
      children: [
        GestureDetector(
            onTap: callback ??
                () async {
                  final tts = await TextToSpeechServices(ref.read)
                      .configure(locale: lang);
                  if (isPlaying == false) {
                    tts.setCompletionHandler(() {
                      ref.read(isPlayingRiverpod.state).state = false;
                    });
                    tts.setCancelHandler(() {
                      ref.read(isPlayingRiverpod.state).state = false;
                    });
                    ref.read(isPlayingRiverpod.state).state = true;
                    await tts.speak(text);
                  } else {
                    ref.read(isPlayingRiverpod.state).state = false;
                    await tts.stop();
                  }
                },
            child: Visibility(
                visible: !isPlaying,
                replacement: const Icon(Icons.cancel, size: 54),
                child: Lottie.asset("assets/images/play.json",
                    height: 70, width: 70))),
        GestureDetector(
          onTap: callback ??
              () async {
                if (isPlaying == false) {
                  final tts = await TextToSpeechServices(ref.read)
                      .configure(locale: lang);
                  tts.setCompletionHandler(() {
                    ref.read(isPlayingRiverpod.state).state = false;
                  });
                  ref.read(isPlayingRiverpod.state).state = true;
                  await tts.speak(text);
                }
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
        Visibility(
          visible: isPlaying,
          child: Lottie.asset(
            "assets/images/audio.json",
            height: 70,
          ),
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
        tts.setCompletionHandler(() {
          ref.read(isPlayingRiverpod.state).state = false;
        });
        tts.setCancelHandler(() {
          ref.read(isPlayingRiverpod.state).state = false;
        });
        if (ref.read(isPlayingRiverpod.state).state) {
          ref.read(isPlayingRiverpod.state).state = false;
          await tts.stop();
          return;
        }
        StringBuffer buffer = StringBuffer();
        for (var i = 0; i < steps.length; i++) {
          buffer.write("step $i");
          buffer.write(steps[i]);
          buffer.write("\n ");
        }
        ref.read(isPlayingRiverpod.state).state = true;

        tts.speak(buffer.toString());
      },
    );
  }
}
