import 'package:auto_route/auto_route.dart';
import 'package:grnagain/src/router/guards/auth_guard.dart';
import 'package:grnagain/src/router/router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: HomeRoute.page,
          path: '/home',
          initial: true,
          guards: [
            AuthGuard(),
          ],
          children: [
            AutoRoute(
              page: CropsRoute.page,
              path: 'crops-view',
              initial: true,
            ),
            AutoRoute(
              page: HistoryRoute.page,
              path: 'history',
            ),
            AutoRoute(
              page: AgrovetShopsRoute.page,
              path: 'agrovet-shops',
            ),
            AutoRoute(
              page: ProfileRoute.page,
              path: 'profile',
            ),
          ],
        ),
        AutoRoute(
          page: BookmarksRoute.page,
          path: '/bookmarks',
        ),
        AutoRoute(
          page: LoginRoute.page,
          path: '/login',
        ),
        AutoRoute(
          page: SignupRoute.page,
          path: '/signup',
        ),
        AutoRoute(
          page: CropsDetailsRoute.page,
          path: '/crops-details',
        ),
        AutoRoute(
          page: SettingsRoute.page,
          path: '/settings',
        ),
        AutoRoute(
          page: NotificationsRoute.page,
          path: '/notifications',
        ),
        AutoRoute(
          page: PredictRoute.page,
          path: '/predict/',
        ),
        AutoRoute(
          page: PaymentConfirmRoute.page,
          path: '/payment-confirm',
        ),
        AutoRoute(
          page: PurchaseRoute.page,
          path: '/purchase',
        ),
        AutoRoute(
          page: SolutionRoute.page,
          path: '/solution',
        ),
        AutoRoute(
          page: AboutRoute.page,
          path: '/about',
        ),
        AutoRoute(
          page: ForecastRoute.page,
          path: '/forecast',
        ),
        AutoRoute(
          page: DiseaseDetailsRoute.page,
          path: '/predict-disease',
        ),
        AutoRoute(
          page: SoilAnalysisRoute.page,
          path: '/soil-analysis',
        ),
      ];
}
