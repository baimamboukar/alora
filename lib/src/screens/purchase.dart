import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grnagain/i18n/strings.g.dart';
import 'package:grnagain/src/configs/index.dart';
import 'package:grnagain/src/extensions/contextx.dart';
import 'package:grnagain/src/extensions/extensions.dart';
import 'package:grnagain/src/widgets/button.dart';
import 'package:line_icons/line_icons.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class PurchasePage extends StatelessWidget {
  const PurchasePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Feature> features = [
      Feature(name: t.features.detectDisease, isPrenium: true),
      Feature(name: t.features.getInfos, isPrenium: false),
      Feature(name: t.features.viewSolution, isPrenium: true),
      Feature(name: t.features.bookmarkForFuture, isPrenium: false),
      Feature(name: t.features.accessRessources, isPrenium: true),
      Feature(name: t.features.customizeApp, isPrenium: false),
    ];
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Palette.light.withOpacity(.5), Palette.light],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: ListView(
              children: <Widget>[
                const SizedBox(height: 20),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Lottie.asset(
                      'assets/images/leaves.json',
                      width: MediaQuery.of(context).size.width,
                      height: 150,
                    ),
                    Column(
                      children: [
                        Center(
                          child: Text(
                            t.purchasePrenium,
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: context.colorScheme.primary),
                          ),
                        ),
                        const Icon(LineIcons.medal,
                            color: Colors.orangeAccent, size: 100),
                      ],
                    )
                  ],
                ),
                //const SizedBox(height: 4),
                // const Center(
                //   child: Text(
                //     'Coming soon!',
                //     style: TextStyle(
                //         fontSize: 16,
                //         fontWeight: FontWeight.bold,
                //         color: Colors.white),
                //   ),
                // ),
                //const SizedBox(height: 20),
                // const Center(
                //   child: Text(
                //     'We are working hard to bring you the best experience possible.',
                //     style: TextStyle(
                //         fontSize: 16,
                //         fontWeight: FontWeight.normal,
                //         color: Palette.dark),
                //   ),
                // ),
                // const SizedBox(height: 20),
                Card(
                  elevation: 8.0,
                  // ignore: sized_box_for_whitespace
                  child: Container(
                    width: context.screenWidth * 0.7,
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Column(
                        children: [
                          Text(
                            "Features",
                            style: Styles.designText(
                                color: context.colorScheme.primary,
                                size: 22,
                                bold: true),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text("Basic"),
                              SizedBox(width: 20),
                              Text("Prenium")
                            ],
                          ),
                          ...features,
                          const SizedBox(
                            height: 20,
                          ),
                          Button(
                            callback: () async {
                              const link =
                                  'https://pay.mesomb.com/l/csAB9c22Qkksj08fZhcl';
                              // launch a URL
                              await _launchUrl(link);
                            },
                            label: "Purchase",
                            isLoading: false,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Lottie.asset('assets/images/leaves.json'),
              ],
            ),
          )),
    );
  }
}

class Feature extends StatelessWidget {
  final String name;
  final bool isPrenium;
  const Feature({super.key, required this.name, required this.isPrenium});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Icon(
            LineIcons.dotCircle,
            size: 20,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(name,
              style: GoogleFonts.alexBrush(
                color: Colors.orangeAccent,
                fontSize: 18,
              )),
          Expanded(
            child: Container(),
          ),
          Icon(
            isPrenium ? LineIcons.timesCircle : LineIcons.checkCircleAlt,
            color: isPrenium ? Palette.danger : context.colorScheme.primary,
          ),
          const SizedBox(width: 35),
          Icon(
            LineIcons.checkCircleAlt,
            color: context.colorScheme.primary,
          ),
        ],
      ),
    );
  }
}

Future<void> _launchUrl(String url) async {
  if (!await launchUrl(Uri.parse(url))) {
    throw Exception('Could not launch $url');
  }
}
