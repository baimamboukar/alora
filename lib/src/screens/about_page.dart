import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:grnagain/src/app/constants.dart';
import 'package:grnagain/src/configs/index.dart';
import 'package:grnagain/src/extensions/contextx.dart';
import 'package:grnagain/src/extensions/num.dart';
import 'package:grnagain/src/extensions/widgetx.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

@RoutePage()
class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  late YoutubePlayerController _controller;
  @override
  void initState() {
    super.initState();
    const video = YOUTUBE_URL;
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(
        video,
      )!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        loop: false,
      ),
    )..addListener(() {
        if (mounted) {
          setState(() {});
        }
      });
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Green Again'),
      ),
      body: YoutubePlayerBuilder(
        player: YoutubePlayer(controller: _controller),
        builder: (context, player) => Column(
          children: [
            34.vGap,
            YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              progressIndicatorColor: context.colorScheme.primary,
              progressColors: ProgressBarColors(
                playedColor: context.colorScheme.primary,
                handleColor: Palette.dark,
              ),
              onReady: () {
                //print('Player is ready.');
              },
              bottomActions: [
                CurrentPosition(),
                const SizedBox(width: 10.0),
                ProgressBar(isExpanded: true),
                const SizedBox(width: 10.0),
                RemainingDuration(),
                FullScreenButton(),
              ],
              thumbnail: Center(
                child: Image.asset("assets/images/grnagain.png"),
              ),
            ),
            24.vGap,
            Text(
              """Green Again is a platform that connects you with local farmers and producers. We are committed to providing you with the freshest and most nutritious produce available. We believe that by supporting local farmers, we can help build a more sustainable and resilient food system. Thank you for choosing Green Again!""",
              style: context.paragraph,
            ),
            14.vGap,
            ElevatedButton(
              onPressed: () {
                //context.router.pop();
              },
              child: const Text('Rate US on Play Store'),
            ),
          ],
        ).hPadding.vPadding,
      ),
    );
  }
}
