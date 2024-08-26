import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grnagain/i18n/strings.g.dart';
import 'package:grnagain/src/configs/index.dart';
import 'package:grnagain/src/extensions/contextx.dart';
import 'package:grnagain/src/extensions/extensions.dart';
import 'package:grnagain/src/models/crop_model.dart';
import 'package:grnagain/src/widgets/index.dart';
import 'package:grnagain/src/widgets/text_to_speech.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:line_icons/line_icons.dart';

@RoutePage()
class CropsDetailsPage extends ConsumerStatefulWidget {
  final Crop model;
  const CropsDetailsPage({
    super.key,
    required this.model,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CropsDetailsState();
}

class _CropsDetailsState extends ConsumerState<CropsDetailsPage> {
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
                  onTap: () => context.autorouter.maybePop(),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundColor: context.colorScheme.surface,
                    child: Center(
                      child: Icon(
                        Icons.chevron_left,
                        size: 32,
                        color: context.colorScheme.primary,
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
                              box.put('bookmarks',
                                  [widget.model.id, ...bookmarked.toSet()]);
                              setState(() {});
                            },
                            child: CircleAvatar(
                              radius: 28,
                              backgroundColor: context.colorScheme.primary,
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
                                        color: context.colorScheme.primary,
                                        size: 16)),
                                Text(widget.model.scienticName,
                                    style: Styles.designText(
                                        bold: false,
                                        color: context.colorScheme.primary,
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
                          // FirebaseAuthentication.isPreniumUser
                          //     ? context.autorouter
                          //         .push(Solution(model: widget.model))
                          //     : context.autorouter.pushNamed('/purchase');
                        },
                        isLoading: false,
                        label: t.solution)
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
