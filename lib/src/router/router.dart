import 'package:alora/src/router/guards/index.dart';
import 'package:alora/src/screens/crops_details.dart';
import 'package:alora/src/screens/crops_view.dart';
import 'package:alora/src/screens/index.dart';
import 'package:alora/src/screens/notifications.dart';
import 'package:auto_route/auto_route.dart';

@AdaptiveAutoRouter(replaceInRouteName: 'Page,Route', routes: <AutoRoute>[
  AutoRoute(page: Home, path: '/home', initial: true, children: [
    AutoRoute(page: CropsView, path: 'crops-view', initial: true),
    AutoRoute(page: Bookmarks, path: 'bookmarks', initial: false),
    AutoRoute(page: Settings, path: 'settings', initial: false),
  ], guards: [
    AuthGuard
  ]),
  AutoRoute(page: Login, path: '/login', initial: false),
  AutoRoute(page: Signup, path: '/signup', initial: false),
  AutoRoute(page: CropsDetails, path: '/crops-details', initial: false),
  AutoRoute(page: Profile, path: '/profile', initial: false),
  AutoRoute(page: Notifications, path: '/notifications', initial: false),
])
class $AppRouter {}
