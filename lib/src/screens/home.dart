import 'package:alora/src/configs/index.dart';
import 'package:alora/src/extensions/extensions.dart';
import 'package:alora/src/router/router.gr.dart' as routes;
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:line_icons/line_icons.dart';

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
        routes.Profile(),
      ],
      builder: (context, child, animation) => ScaleTransition(
        scale: animation,
        child: child,
      ),
      bottomNavigationBuilder: (context, router) {
        return BottomNavigationBar(
          elevation: 12,
          // backgroundColor: Colors.white,
          selectedItemColor: Palette.primary,
          unselectedItemColor: Palette.primary.withOpacity(.55),
          currentIndex: router.activeIndex,
          onTap: (index) => router.setActiveIndex(index),
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: const Icon(
                LineIcons.leaf,
                size: 22,
              ),
              label: context.loc.library,
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                LineIcons.heart,
                size: 22,
              ),
              label: context.loc.bookmarks,
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                LineIcons.user,
                size: 22,
              ),
              backgroundColor: Palette.dark,
              label: context.loc.profile,
            ),
          ],
        );
      },
    );
  }
}
