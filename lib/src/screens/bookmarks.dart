import 'package:alora/src/configs/data.dart';
import 'package:alora/src/configs/index.dart';
import 'package:alora/src/extensions/extensions.dart';
import 'package:alora/src/widgets/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Bookmarks extends ConsumerStatefulWidget {
  const Bookmarks({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BookmarksState();
}

class _BookmarksState extends ConsumerState<Bookmarks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const SizedBox(height: 40),
            // Button(
            //   isLoading: false,
            //   label: context.loc.login,
            //   callback: () => context.autorouter.pushNamed('/login'),
            // ),
            // Button(
            //   isLoading: false,
            //   label: context.loc.singup,
            //   callback: () => context.autorouter.pushNamed('/signup'),
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/user.png'),
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
                Text("Your bookmarks",
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
                        decoration: InputDecoration(
                          hintText: context.loc.searchLinary,
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
                  onTap: () {},
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
            Expanded(
              child: GridView.count(
                shrinkWrap: true,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
                crossAxisCount: 2,
                children: <Widget>[
                  ...crops.where((crop) => crop.bookMarked).map(
                        (crop) => CropCaption(crop),
                      ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: CircleAvatar(
        radius: 28,
        backgroundColor: Palette.primary,
        child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.document_scanner,
              color: Palette.light,
            )),
      ),
    );
  }
}
