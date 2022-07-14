import 'package:alora/src/configs/index.dart';
import 'package:alora/src/extensions/extensions.dart';
import 'package:alora/src/router/router.gr.dart' as routes;
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final _key = GlobalKey<ScaffoldState>();

class Home extends ConsumerWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AutoTabsScaffold(
      scaffoldKey: _key,
      routes: const [
        routes.CropsView(),
        routes.Bookmarks(),
        routes.Settings(),
      ],
      builder: (context, child, animation) => ScaleTransition(
        scale: animation,
        child: child,
      ),
      bottomNavigationBuilder: (context, router) {
        return BottomNavigationBar(
          elevation: 12,
          backgroundColor: const Color(0xFFFFFFFF),
          selectedItemColor: Palette.primary,
          unselectedItemColor: Palette.primary.withOpacity(.55),
          currentIndex: router.activeIndex,
          onTap: (index) => router.setActiveIndex(index),
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.home,
                size: 22,
              ),
              label: context.loc.crops,
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.bookmark,
                size: 22,
              ),
              label: context.loc.bookmarks,
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.settings,
                size: 22,
              ),
              backgroundColor: Palette.dark,
              label: context.loc.settings,
            ),
          ],
        );
      },
    );
  }
}
