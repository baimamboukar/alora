import 'package:grnagain/src/configs/index.dart';
import 'package:grnagain/src/extensions/extensions.dart';
import 'package:grnagain/src/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:lottie/lottie.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class Purchase extends StatelessWidget {
  const Purchase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Feature> features = const [
      Feature(name: "Detect diseases on crops", isPrenium: true),
      Feature(name: "Get Infos on diseases", isPrenium: false),
      Feature(name: "View the solutions", isPrenium: true),
      Feature(name: "Bookmark for future read", isPrenium: false),
      Feature(name: "Acess ressources", isPrenium: true),
      Feature(name: "Customize app settings", isPrenium: false),
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
                      children: const [
                        Center(
                          child: Text(
                            'Purchase prenium',
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Palette.primary),
                          ),
                        ),
                        Icon(LineIcons.medal,
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
                                color: Palette.primary, size: 22, bold: true),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: const [
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
                            callback: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return SafeArea(
                                    child: Scaffold(
                                      appBar: AppBar(
                                        //backgroundColor: Colors.transparent,
                                        backgroundColor: Palette.primary,
                                        elevation: 0,
                                        title: Text(
                                          "Payment Checkout",
                                          style: Styles.designText(
                                              bold: false,
                                              size: 14,
                                              color: Palette.light),
                                        ),
                                      ),
                                      body: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: WebViewPlus(
                                          navigationDelegate: (nav) async {
                                            if (nav.url
                                                .contains("grnagain.page.link")) {
                                              Navigator.pop(context);
                                              Navigator.pop(context);
                                              launchUrl(
                                                  Uri.parse(nav.url
                                                      .split('#')[0]
                                                      .replaceAll(
                                                          'intent', 'https')),
                                                  mode: LaunchMode
                                                      .externalNonBrowserApplication);
                                              return NavigationDecision.prevent;
                                            }
                                            return NavigationDecision.prevent;
                                          },
                                          debuggingEnabled: true,
                                          javascriptMode:
                                              JavascriptMode.unrestricted,
                                          onWebViewCreated: (controller) {
                                            controller.loadUrl(
                                                "https://mesomb.hachther.com/en/web/payment/CM/?widget=253");
                                          },
                                          // initialUrl:
                                          // "https://mesomb.hachther.com/en/web/payment/CM/?widget=253",
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
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
  const Feature({Key? key, required this.name, required this.isPrenium})
      : super(key: key);

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
            color: isPrenium ? Palette.danger : Palette.primary,
          ),
          const SizedBox(width: 35),
          const Icon(
            LineIcons.checkCircleAlt,
            color: Palette.primary,
          ),
        ],
      ),
    );
  }
}
