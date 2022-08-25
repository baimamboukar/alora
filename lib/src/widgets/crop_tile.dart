import 'package:grnagain/src/configs/index.dart';
import 'package:grnagain/src/extensions/extensions.dart';
import 'package:grnagain/src/models/crop_model.dart';
import 'package:grnagain/src/router/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:line_icons/line_icons.dart';

class CropCaption extends ConsumerWidget {
  final Crop crop;
  const CropCaption(
    this.crop, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
        onTap: () {
          context.autorouter.navigate(CropsDetails(model: crop));
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 2,
          child: Container(
            height: 170,
            width: 165,
            decoration: BoxDecoration(
              //color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(children: [
              Align(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  crop.imageURL.caption,
                  width: 165,
                  height: 116,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 14.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 8, top: 24),
                                child: Text(crop.name,
                                    style: Styles.designText(
                                        bold: false,
                                        color: Palette.primary,
                                        size: 15)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(crop.scienticName,
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: true,
                                    style: Styles.designText(
                                        bold: false,
                                        color: Palette.primary,
                                        size: 9)),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(right: 8.0, top: 12),
                            child: GestureDetector(
                              onTap: () {
                                final Box box = Hive.box('bookmarks');
                                List<String> bookmarked =
                                    box.get('crops') ?? <String>[];
                                box.put('crops', [crop.id, ...bookmarked]);
                              },
                              child: Icon(
                                crop.isBookmarked
                                    ? LineIcons.heart
                                    : LineIcons.heartAlt,
                                size: 18,
                              ),
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ));
  }
}
