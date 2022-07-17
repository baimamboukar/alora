// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:alora/src/models/crop_model.dart' as _i9;
import 'package:alora/src/router/guards/index.dart' as _i8;
import 'package:alora/src/screens/crops_details.dart' as _i2;
import 'package:alora/src/screens/crops_view.dart' as _i5;
import 'package:alora/src/screens/index.dart' as _i1;
import 'package:alora/src/screens/notifications.dart' as _i3;
import 'package:alora/src/screens/predict.dart' as _i4;
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;
import 'package:image_picker/image_picker.dart' as _i10;

class AppRouter extends _i6.RootStackRouter {
  AppRouter(
      {_i7.GlobalKey<_i7.NavigatorState>? navigatorKey,
      required this.authGuard})
      : super(navigatorKey);

  final _i8.AuthGuard authGuard;

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    Home.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.Home());
    },
    Login.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.Login());
    },
    Signup.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.Signup());
    },
    CropsDetails.name: (routeData) {
      final args = routeData.argsAs<CropsDetailsArgs>();
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i2.CropsDetails(key: args.key, model: args.model));
    },
    Settings.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.Settings());
    },
    Notifications.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i3.Notifications());
    },
    Predict.name: (routeData) {
      final args = routeData.argsAs<PredictArgs>();
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i4.Predict(key: args.key, image: args.image));
    },
    CropsView.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i5.CropsView());
    },
    Bookmarks.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.Bookmarks());
    },
    Profile.name: (routeData) {
      return _i6.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.Profile());
    }
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig('/#redirect',
            path: '/', redirectTo: '/home', fullMatch: true),
        _i6.RouteConfig(Home.name, path: '/home', guards: [
          authGuard
        ], children: [
          _i6.RouteConfig('#redirect',
              path: '',
              parent: Home.name,
              redirectTo: 'crops-view',
              fullMatch: true),
          _i6.RouteConfig(CropsView.name,
              path: 'crops-view', parent: Home.name),
          _i6.RouteConfig(Bookmarks.name, path: 'bookmarks', parent: Home.name),
          _i6.RouteConfig(Profile.name, path: 'profile', parent: Home.name)
        ]),
        _i6.RouteConfig(Login.name, path: '/login'),
        _i6.RouteConfig(Signup.name, path: '/signup'),
        _i6.RouteConfig(CropsDetails.name, path: '/crops-details'),
        _i6.RouteConfig(Settings.name, path: '/settings'),
        _i6.RouteConfig(Notifications.name, path: '/notifications'),
        _i6.RouteConfig(Predict.name, path: '/predict/')
      ];
}

/// generated route for
/// [_i1.Home]
class Home extends _i6.PageRouteInfo<void> {
  const Home({List<_i6.PageRouteInfo>? children})
      : super(Home.name, path: '/home', initialChildren: children);

  static const String name = 'Home';
}

/// generated route for
/// [_i1.Login]
class Login extends _i6.PageRouteInfo<void> {
  const Login() : super(Login.name, path: '/login');

  static const String name = 'Login';
}

/// generated route for
/// [_i1.Signup]
class Signup extends _i6.PageRouteInfo<void> {
  const Signup() : super(Signup.name, path: '/signup');

  static const String name = 'Signup';
}

/// generated route for
/// [_i2.CropsDetails]
class CropsDetails extends _i6.PageRouteInfo<CropsDetailsArgs> {
  CropsDetails({_i7.Key? key, required _i9.Crop model})
      : super(CropsDetails.name,
            path: '/crops-details',
            args: CropsDetailsArgs(key: key, model: model));

  static const String name = 'CropsDetails';
}

class CropsDetailsArgs {
  const CropsDetailsArgs({this.key, required this.model});

  final _i7.Key? key;

  final _i9.Crop model;

  @override
  String toString() {
    return 'CropsDetailsArgs{key: $key, model: $model}';
  }
}

/// generated route for
/// [_i1.Settings]
class Settings extends _i6.PageRouteInfo<void> {
  const Settings() : super(Settings.name, path: '/settings');

  static const String name = 'Settings';
}

/// generated route for
/// [_i3.Notifications]
class Notifications extends _i6.PageRouteInfo<void> {
  const Notifications() : super(Notifications.name, path: '/notifications');

  static const String name = 'Notifications';
}

/// generated route for
/// [_i4.Predict]
class Predict extends _i6.PageRouteInfo<PredictArgs> {
  Predict({_i7.Key? key, required _i10.XFile image})
      : super(Predict.name,
            path: '/predict/', args: PredictArgs(key: key, image: image));

  static const String name = 'Predict';
}

class PredictArgs {
  const PredictArgs({this.key, required this.image});

  final _i7.Key? key;

  final _i10.XFile image;

  @override
  String toString() {
    return 'PredictArgs{key: $key, image: $image}';
  }
}

/// generated route for
/// [_i5.CropsView]
class CropsView extends _i6.PageRouteInfo<void> {
  const CropsView() : super(CropsView.name, path: 'crops-view');

  static const String name = 'CropsView';
}

/// generated route for
/// [_i1.Bookmarks]
class Bookmarks extends _i6.PageRouteInfo<void> {
  const Bookmarks() : super(Bookmarks.name, path: 'bookmarks');

  static const String name = 'Bookmarks';
}

/// generated route for
/// [_i1.Profile]
class Profile extends _i6.PageRouteInfo<void> {
  const Profile() : super(Profile.name, path: 'profile');

  static const String name = 'Profile';
}
