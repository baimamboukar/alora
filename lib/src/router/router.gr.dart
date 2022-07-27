// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:alora/src/models/crop_model.dart' as _i12;
import 'package:alora/src/router/guards/index.dart' as _i11;
import 'package:alora/src/screens/crops_details.dart' as _i2;
import 'package:alora/src/screens/crops_view.dart' as _i8;
import 'package:alora/src/screens/index.dart' as _i1;
import 'package:alora/src/screens/notifications.dart' as _i3;
import 'package:alora/src/screens/payment_confirm.dart' as _i5;
import 'package:alora/src/screens/predict.dart' as _i4;
import 'package:alora/src/screens/purchase.dart' as _i6;
import 'package:alora/src/screens/solution.dart' as _i7;
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i10;
import 'package:image_picker/image_picker.dart' as _i13;

class AppRouter extends _i9.RootStackRouter {
  AppRouter(
      {_i10.GlobalKey<_i10.NavigatorState>? navigatorKey,
      required this.authGuard})
      : super(navigatorKey);

  final _i11.AuthGuard authGuard;

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    Home.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.Home());
    },
    Login.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.Login());
    },
    Signup.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.Signup());
    },
    CropsDetails.name: (routeData) {
      final args = routeData.argsAs<CropsDetailsArgs>();
      return _i9.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i2.CropsDetails(key: args.key, model: args.model));
    },
    Settings.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.Settings());
    },
    Notifications.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i3.Notifications());
    },
    Predict.name: (routeData) {
      final args = routeData.argsAs<PredictArgs>();
      return _i9.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i4.Predict(key: args.key, image: args.image));
    },
    PaymentConfirm.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i5.PaymentConfirm());
    },
    Purchase.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i6.Purchase());
    },
    Solution.name: (routeData) {
      final args = routeData.argsAs<SolutionArgs>();
      return _i9.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i7.Solution(key: args.key, model: args.model));
    },
    CropsView.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i8.CropsView());
    },
    Bookmarks.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.Bookmarks());
    },
    Profile.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.Profile());
    }
  };

  @override
  List<_i9.RouteConfig> get routes => [
        _i9.RouteConfig('/#redirect',
            path: '/', redirectTo: '/home', fullMatch: true),
        _i9.RouteConfig(Home.name, path: '/home', guards: [
          authGuard
        ], children: [
          _i9.RouteConfig('#redirect',
              path: '',
              parent: Home.name,
              redirectTo: 'crops-view',
              fullMatch: true),
          _i9.RouteConfig(CropsView.name,
              path: 'crops-view', parent: Home.name),
          _i9.RouteConfig(Bookmarks.name, path: 'bookmarks', parent: Home.name),
          _i9.RouteConfig(Profile.name, path: 'profile', parent: Home.name)
        ]),
        _i9.RouteConfig(Login.name, path: '/login'),
        _i9.RouteConfig(Signup.name, path: '/signup'),
        _i9.RouteConfig(CropsDetails.name, path: '/crops-details'),
        _i9.RouteConfig(Settings.name, path: '/settings'),
        _i9.RouteConfig(Notifications.name, path: '/notifications'),
        _i9.RouteConfig(Predict.name, path: '/predict/'),
        _i9.RouteConfig(PaymentConfirm.name, path: '/payment-confirm'),
        _i9.RouteConfig(Purchase.name, path: '/purchase'),
        _i9.RouteConfig(Solution.name, path: '/solution')
      ];
}

/// generated route for
/// [_i1.Home]
class Home extends _i9.PageRouteInfo<void> {
  const Home({List<_i9.PageRouteInfo>? children})
      : super(Home.name, path: '/home', initialChildren: children);

  static const String name = 'Home';
}

/// generated route for
/// [_i1.Login]
class Login extends _i9.PageRouteInfo<void> {
  const Login() : super(Login.name, path: '/login');

  static const String name = 'Login';
}

/// generated route for
/// [_i1.Signup]
class Signup extends _i9.PageRouteInfo<void> {
  const Signup() : super(Signup.name, path: '/signup');

  static const String name = 'Signup';
}

/// generated route for
/// [_i2.CropsDetails]
class CropsDetails extends _i9.PageRouteInfo<CropsDetailsArgs> {
  CropsDetails({_i10.Key? key, required _i12.Crop model})
      : super(CropsDetails.name,
            path: '/crops-details',
            args: CropsDetailsArgs(key: key, model: model));

  static const String name = 'CropsDetails';
}

class CropsDetailsArgs {
  const CropsDetailsArgs({this.key, required this.model});

  final _i10.Key? key;

  final _i12.Crop model;

  @override
  String toString() {
    return 'CropsDetailsArgs{key: $key, model: $model}';
  }
}

/// generated route for
/// [_i1.Settings]
class Settings extends _i9.PageRouteInfo<void> {
  const Settings() : super(Settings.name, path: '/settings');

  static const String name = 'Settings';
}

/// generated route for
/// [_i3.Notifications]
class Notifications extends _i9.PageRouteInfo<void> {
  const Notifications() : super(Notifications.name, path: '/notifications');

  static const String name = 'Notifications';
}

/// generated route for
/// [_i4.Predict]
class Predict extends _i9.PageRouteInfo<PredictArgs> {
  Predict({_i10.Key? key, required _i13.XFile image})
      : super(Predict.name,
            path: '/predict/', args: PredictArgs(key: key, image: image));

  static const String name = 'Predict';
}

class PredictArgs {
  const PredictArgs({this.key, required this.image});

  final _i10.Key? key;

  final _i13.XFile image;

  @override
  String toString() {
    return 'PredictArgs{key: $key, image: $image}';
  }
}

/// generated route for
/// [_i5.PaymentConfirm]
class PaymentConfirm extends _i9.PageRouteInfo<void> {
  const PaymentConfirm() : super(PaymentConfirm.name, path: '/payment-confirm');

  static const String name = 'PaymentConfirm';
}

/// generated route for
/// [_i6.Purchase]
class Purchase extends _i9.PageRouteInfo<void> {
  const Purchase() : super(Purchase.name, path: '/purchase');

  static const String name = 'Purchase';
}

/// generated route for
/// [_i7.Solution]
class Solution extends _i9.PageRouteInfo<SolutionArgs> {
  Solution({_i10.Key? key, required _i12.Crop model})
      : super(Solution.name,
            path: '/solution', args: SolutionArgs(key: key, model: model));

  static const String name = 'Solution';
}

class SolutionArgs {
  const SolutionArgs({this.key, required this.model});

  final _i10.Key? key;

  final _i12.Crop model;

  @override
  String toString() {
    return 'SolutionArgs{key: $key, model: $model}';
  }
}

/// generated route for
/// [_i8.CropsView]
class CropsView extends _i9.PageRouteInfo<void> {
  const CropsView() : super(CropsView.name, path: 'crops-view');

  static const String name = 'CropsView';
}

/// generated route for
/// [_i1.Bookmarks]
class Bookmarks extends _i9.PageRouteInfo<void> {
  const Bookmarks() : super(Bookmarks.name, path: 'bookmarks');

  static const String name = 'Bookmarks';
}

/// generated route for
/// [_i1.Profile]
class Profile extends _i9.PageRouteInfo<void> {
  const Profile() : super(Profile.name, path: 'profile');

  static const String name = 'Profile';
}
