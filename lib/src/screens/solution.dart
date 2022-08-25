import 'package:grnagain/i18n/strings.g.dart';
import 'package:grnagain/src/configs/index.dart';
import 'package:grnagain/src/extensions/extensions.dart';
import 'package:grnagain/src/models/crop_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grnagain/src/widgets/text_to_speech.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:line_icons/line_icons.dart';

class Solution extends ConsumerStatefulWidget {
  final Crop model;
  const Solution({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SolutionState();
}

class _SolutionState extends ConsumerState<Solution> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Hive.box('settings').get('theme') ? Colors.black : Colors.white,
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              filterQuality: FilterQuality.high,
              scale: .75,
              fit: BoxFit.cover,
              image: AssetImage(widget.model.imageURL.details),
            ),
          ),
          child: Column(children: [
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () => context.autorouter.pop(),
                  child: const CircleAvatar(
                    radius: 20,
                    backgroundColor: Color(0xFFEAEAEA),
                    child: Center(
                      child: Icon(
                        Icons.chevron_left,
                        size: 32,
                        color: Palette.primary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 200,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Hive.box('settings').get('theme')
                      ? Colors.black
                      : Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  )),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                          right: 24,
                          top: -32,
                          child: CircleAvatar(
                            radius: 28,
                            backgroundColor: Palette.primary,
                            child: IconButton(
                              onPressed: () {
                                final Box box = Hive.box('bookmarks');
                                List<String> bookmarked =
                                    box.get('crops') ?? <String>[];
                                box.put(
                                    'crops', [widget.model.id, ...bookmarked]);
                              },
                              icon: Icon(
                                widget.model.isBookmarked
                                    ? LineIcons.heartAlt
                                    : LineIcons.heart,
                                color: Palette.light,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(
                                30.0, 12.0, 0.0, 14.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(widget.model.name,
                                    style: Styles.designText(
                                        bold: true,
                                        color: Palette.primary,
                                        size: 16)),
                                Text(widget.model.scienticName,
                                    style: Styles.designText(
                                        bold: false,
                                        color: Palette.primary,
                                        size: 12)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    TextToSpeech.forSteps(
                        widget.model.treatment.steps, "en-AU", ref),
                    const SizedBox(height: 14),
                    Text(t.solutionAndTreatment,
                        style: Styles.designText(
                            bold: true, size: 16.5, color: Palette.primary)),
                    const SizedBox(height: 14),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: Column(
                        children: [
                          Text(widget.model.treatment.intro ?? ""),
                          const SizedBox(height: 14),
                          ...widget.model.treatment.steps
                              .map((step) => ExpansionTile(
                                    // trailing: const Icon(
                                    //     Icons.lightbulb_circle_rounded),
                                    initiallyExpanded: true,
                                    controlAffinity:
                                        ListTileControlAffinity.platform,
                                    title: Text(
                                        "🔖 ${t.step} ${widget.model.treatment.steps.indexOf(step) + 1}"),
                                    children: [
                                      Text(step,
                                          style: Styles.designText(
                                              bold: false,
                                              size: 14,
                                              color: Palette.dark))
                                    ],
                                  ))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "💡 ${t.importantTips}",
                            style: Styles.designText(
                                bold: true, size: 14.5, color: Palette.primary),
                          ),
                          Text(
                            widget.model.treatment.outtro ?? "",
                            style: Styles.designText(
                                bold: false,
                                size: 14.5,
                                color: Palette.primary),
                          ),
                        ],
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: Container(
                    //     decoration: BoxDecoration(
                    //         color: Palette.primary,
                    //         borderRadius: BorderRadius.circular(20)),
                    //     child: Padding(
                    //       padding: const EdgeInsets.all(12.0),
                    //       child: Text(widget.model.description,
                    //           style: Styles.designText(
                    //               bold: false, size: 14, color: Palette.light)),
                    //     ),
                    //   ),
                    // ),
                    const SizedBox(height: 28),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
