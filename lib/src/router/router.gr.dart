// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:alora/src/models/crop_model.dart' as _i8;
import 'package:alora/src/router/guards/index.dart' as _i7;
import 'package:alora/src/screens/crops_details.dart' as _i2;
import 'package:alora/src/screens/crops_view.dart' as _i4;
import 'package:alora/src/screens/index.dart' as _i1;
import 'package:alora/src/screens/notifications.dart' as _i3;
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

class AppRouter extends _i5.RootStackRouter {
  AppRouter(
      {_i6.GlobalKey<_i6.NavigatorState>? navigatorKey,
      required this.authGuard})
      : super(navigatorKey);

  final _i7.AuthGuard authGuard;

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    Home.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.Home());
    },
    Login.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.Login());
    },
    Signup.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.Signup());
    },
    CropsDetails.name: (routeData) {
      final args = routeData.argsAs<CropsDetailsArgs>();
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i2.CropsDetails(key: args.key, model: args.model));
    },
    Profile.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.Profile());
    },
    Notifications.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i3.Notifications());
    },
    CropsView.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i4.CropsView());
    },
    Bookmarks.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.Bookmarks());
    },
    Settings.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.Settings());
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig('/#redirect',
            path: '/', redirectTo: '/home', fullMatch: true),
        _i5.RouteConfig(Home.name, path: '/home', guards: [
          authGuard
        ], children: [
          _i5.RouteConfig('#redirect',
              path: '',
              parent: Home.name,
              redirectTo: 'crops-view',
              fullMatch: true),
          _i5.RouteConfig(CropsView.name,
              path: 'crops-view', parent: Home.name),
          _i5.RouteConfig(Bookmarks.name, path: 'bookmarks', parent: Home.name),
          _i5.RouteConfig(Settings.name, path: 'settings', parent: Home.name)
        ]),
        _i5.RouteConfig(Login.name, path: '/login'),
        _i5.RouteConfig(Signup.name, path: '/signup'),
        _i5.RouteConfig(CropsDetails.name, path: '/crops-details'),
        _i5.RouteConfig(Profile.name, path: '/profile'),
        _i5.RouteConfig(Notifications.name, path: '/notifications')
      ];
}

/// generated route for
/// [_i1.Home]
class Home extends _i5.PageRouteInfo<void> {
  const Home({List<_i5.PageRouteInfo>? children})
      : super(Home.name, path: '/home', initialChildren: children);

  static const String name = 'Home';
}

/// generated route for
/// [_i1.Login]
class Login extends _i5.PageRouteInfo<void> {
  const Login() : super(Login.name, path: '/login');

  static const String name = 'Login';
}

/// generated route for
/// [_i1.Signup]
class Signup extends _i5.PageRouteInfo<void> {
  const Signup() : super(Signup.name, path: '/signup');

  static const String name = 'Signup';
}

/// generated route for
/// [_i2.CropsDetails]
class CropsDetails extends _i5.PageRouteInfo<CropsDetailsArgs> {
  CropsDetails({_i6.Key? key, required _i8.Crop model})
      : super(CropsDetails.name,
            path: '/crops-details',
            args: CropsDetailsArgs(key: key, model: model));

  static const String name = 'CropsDetails';
}

class CropsDetailsArgs {
  const CropsDetailsArgs({this.key, required this.model});

  final _i6.Key? key;

  final _i8.Crop model;

  @override
  String toString() {
    return 'CropsDetailsArgs{key: $key, model: $model}';
  }
}

/// generated route for
/// [_i1.Profile]
class Profile extends _i5.PageRouteInfo<void> {
  const Profile() : super(Profile.name, path: '/profile');

  static const String name = 'Profile';
}

/// generated route for
/// [_i3.Notifications]
class Notifications extends _i5.PageRouteInfo<void> {
  const Notifications() : super(Notifications.name, path: '/notifications');

  static const String name = 'Notifications';
}

/// generated route for
/// [_i4.CropsView]
class CropsView extends _i5.PageRouteInfo<void> {
  const CropsView() : super(CropsView.name, path: 'crops-view');

  static const String name = 'CropsView';
}

/// generated route for
/// [_i1.Bookmarks]
class Bookmarks extends _i5.PageRouteInfo<void> {
  const Bookmarks() : super(Bookmarks.name, path: 'bookmarks');

  static const String name = 'Bookmarks';
}

/// generated route for
/// [_i1.Settings]
class Settings extends _i5.PageRouteInfo<void> {
  const Settings() : super(Settings.name, path: 'settings');

  static const String name = 'Settings';
}
