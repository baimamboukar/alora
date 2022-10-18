import 'package:grnagain/i18n/strings.g.dart';
import 'package:grnagain/src/configs/data.dart';
import 'package:grnagain/src/configs/index.dart';
import 'package:grnagain/src/extensions/extensions.dart';
import 'package:grnagain/src/screens/crops_view.dart';
import 'package:grnagain/src/screens/library_search_delegate.dart';
import 'package:grnagain/src/services/auth/firebase_auth.dart';
import 'package:grnagain/src/widgets/index.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Bookmarks extends ConsumerStatefulWidget {
  const Bookmarks({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BookmarksState();
}

class _BookmarksState extends ConsumerState<Bookmarks> {
  // ignore: unused_field
  late List<String> _bookmarked;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Visibility(
                  visible: FirebaseAuth
                          .instance.currentUser?.providerData.first.photoURL !=
                      null,
                  replacement: const CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 32,
                    backgroundImage: AssetImage('assets/images/user.png'),
                  ),
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 32,
                    backgroundImage: NetworkImage(FirebaseAuth.instance
                            .currentUser?.providerData.first.photoURL ??
                        ''),
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.notifications_outlined,
                    color: Palette.primary,
                  ),
                  onPressed: () =>
                      context.autorouter.pushNamed('/notifications'),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                Text(t.yourBookmarks,
                    style: Styles.designText(
                        bold: true, color: Palette.primary, size: 26)),
              ],
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                Container(
                    height: 58.0,
                    width: (context.screenWidth - 76) * .8,
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    decoration: BoxDecoration(
                      color: Palette.light,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Center(
                      child: TextFormField(
                        onTap: () => showSearch(
                            context: context, delegate: CropsSearch()),
                        decoration: InputDecoration(
                          hintText: t.searchLinary,
                          border: InputBorder.none,
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Palette.secondary,
                          ),
                        ),
                      ),
                    )),
                const SizedBox(width: 22),
                GestureDetector(
                  onTap: () {
                    FirebaseAuthentication.isPreniumUser
                        ? showModalBottomSheet(
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) {
                              return const ImagePickModal();
                            },
                          )
                        : context.autorouter.pushNamed('/purchase');
                  },
                  child: Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: Palette.primary,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: const Center(
                        child: Icon(
                      Icons.document_scanner,
                      size: 36,
                      color: Palette.light,
                    )),
                  ),
                )
              ],
            ),
            ValueListenableBuilder(
              valueListenable: Hive.box('user').listenable(),
              builder: (BuildContext context, Box box, Widget? widget) {
                final bookmarks = crops.where((crop) {
                  return crop.isBookmarked;
                }).toList();
                return bookmarks.isEmpty
                    ? Center(
                        child: Text(
                          "No Bookmark found!",
                          style: Styles.designText(
                              bold: true, color: Palette.primary, size: 18),
                        ),
                      )
                    : Expanded(
                        child: GridView.count(
                          shrinkWrap: true,
                          crossAxisSpacing: 4,
                          mainAxisSpacing: 4,
                          crossAxisCount: 2,
                          children: <Widget>[
                            ...crops.where((crop) => crop.isBookmarked).map(
                                  (crop) => CropCaption(crop),
                                ),
                          ],
                        ),
                      );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: CircleAvatar(
        radius: 28,
        backgroundColor: Palette.primary,
        child: IconButton(
            onPressed: () {
              FirebaseAuthentication.isPreniumUser
                  ? showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (context) {
                        return const ImagePickModal();
                      },
                    )
                  : context.autorouter.pushNamed('/purchase');
            },
            icon: const Icon(
              Icons.document_scanner,
              color: Palette.light,
            )),
      ),
    );
  }
}
