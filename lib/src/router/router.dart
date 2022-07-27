import 'package:alora/src/router/guards/index.dart';
import 'package:alora/src/screens/crops_details.dart';
import 'package:alora/src/screens/crops_view.dart';
import 'package:alora/src/screens/index.dart';
import 'package:alora/src/screens/notifications.dart';
import 'package:alora/src/screens/payment_confirm.dart';
import 'package:alora/src/screens/predict.dart';
import 'package:alora/src/screens/purchase.dart';
import 'package:alora/src/screens/solution.dart';
import 'package:auto_route/auto_route.dart';

@AdaptiveAutoRouter(replaceInRouteName: 'Page,Route', routes: <AutoRoute>[
  AutoRoute(page: Home, path: '/home', initial: true, children: [
    AutoRoute(page: CropsView, path: 'crops-view', initial: true),
    AutoRoute(page: Bookmarks, path: 'bookmarks', initial: false),
    AutoRoute(page: Profile, path: 'profile', initial: false),
  ], guards: [
    AuthGuard
  ]),
  AutoRoute(page: Login, path: '/login', initial: false),
  AutoRoute(page: Signup, path: '/signup', initial: false),
  AutoRoute(page: CropsDetails, path: '/crops-details', initial: false),
  AutoRoute(page: Settings, path: '/settings', initial: false),
  AutoRoute(page: Notifications, path: '/notifications', initial: false),
  AutoRoute(page: Predict, path: '/predict/', initial: false),
  AutoRoute(page: PaymentConfirm, path: '/payment-confirm', initial: false),
  AutoRoute(page: Purchase, path: '/purchase', initial: false),
  AutoRoute(page: Solution, path: '/solution', initial: false),
])
class $AppRouter {}
