import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grnagain/i18n/strings.g.dart';
import 'package:grnagain/src/router/router.gr.dart';
import 'package:line_icons/line_icons.dart';

final _key = GlobalKey<ScaffoldState>();

@RoutePage()
class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AutoTabsScaffold(
      scaffoldKey: _key,
      routes: const [
        CropsRoute(),
        AgrovetShopsRoute(),
        HistoryRoute(),
        ProfileRoute(),
      ],
      transitionBuilder: (context, child, animation) => ScaleTransition(
        scale: animation,
        child: child,
      ),
      bottomNavigationBuilder: (context, router) => NavigationBar(
        selectedIndex: router.activeIndex,
        onDestinationSelected: (index) {
          router.setActiveIndex(index);
        },
        destinations: [
          NavigationDestination(
              icon: const Icon(LineIcons.leaf), label: t.library),
          const NavigationDestination(
              icon: Icon(LineIcons.shoppingBag), label: "Agrovet Shops"),
          const NavigationDestination(
              icon: Icon(LineIcons.clockAlt), label: "History"),
          NavigationDestination(
              icon: const Icon(LineIcons.user), label: t.profile),
        ],
      ),
    );
  }
}
