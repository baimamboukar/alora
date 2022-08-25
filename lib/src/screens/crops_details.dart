import 'package:grnagain/src/configs/index.dart';
import 'package:grnagain/src/extensions/extensions.dart';
import 'package:grnagain/src/models/crop_model.dart';
import 'package:grnagain/src/router/router.gr.dart';
import 'package:grnagain/src/services/auth/firebase_auth.dart';
import 'package:grnagain/src/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:line_icons/line_icons.dart';

import '../widgets/text_to_speech.dart';

class CropsDetails extends ConsumerStatefulWidget {
  final Crop model;
  const CropsDetails({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CropsDetailsState();
}

class _CropsDetailsState extends ConsumerState<CropsDetails> {
  @override
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
                          child: GestureDetector(
                            onTap: () {
                              final Box box = Hive.box('user');
                              List<String> bookmarked =
                                  box.get('bookmarks') ?? <String>[];
                              box.put('bookmarks', [
                                widget.model.id,
                                ...bookmarked.toSet().toList()
                              ]);
                              setState(() {});
                            },
                            child: CircleAvatar(
                              radius: 28,
                              backgroundColor: Palette.primary,
                              child: Icon(
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
                    const SizedBox(height: 14),
                    TextToSpeech(text: widget.model.description, lang: "en-AU"),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: Text(widget.model.description,
                          style: Styles.designText(
                              bold: false, color: Palette.dark, size: 14)),
                    ),
                    const SizedBox(height: 28),
                    Button(
                      callback: () {
                        FirebaseAuthentication.isPreniumUser
                            ? context.autorouter
                                .push(Solution(model: widget.model))
                            : context.autorouter.pushNamed('/purchase');
                      },
                      isLoading: false,
                      label: "Solution",
                    )
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
