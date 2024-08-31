import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grnagain/i18n/strings.g.dart';
import 'package:grnagain/src/configs/data.dart';
import 'package:grnagain/src/configs/index.dart';
import 'package:grnagain/src/extensions/contextx.dart';
import 'package:grnagain/src/extensions/extensions.dart';
import 'package:grnagain/src/screens/library_search_delegate.dart';
import 'package:grnagain/src/widgets/index.dart';
import 'package:grnagain/src/widgets/scanner_launcher.dart';
import 'package:hive_flutter/hive_flutter.dart';

@RoutePage()
class BookmarksPage extends ConsumerStatefulWidget {
  const BookmarksPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BookmarksState();
}

class _BookmarksState extends ConsumerState<BookmarksPage> {
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
                    radius: 14,
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
                  icon: Icon(
                    Icons.notifications_outlined,
                    color: context.colorScheme.primary,
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
                        bold: true,
                        color: context.colorScheme.primary,
                        size: 26)),
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
                const ScannerLauncher()
              ],
            ),
            const SizedBox(height: 28),
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
                              bold: true,
                              color: context.colorScheme.primary,
                              size: 18),
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
      floatingActionButton: const ScannerLauncher(),
    );
  }
}
