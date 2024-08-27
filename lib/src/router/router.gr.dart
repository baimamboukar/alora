// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i18;
import 'package:flutter/material.dart' as _i19;
import 'package:grnagain/src/models/crop_model.dart' as _i20;
import 'package:grnagain/src/screens/about_page.dart' as _i1;
import 'package:grnagain/src/screens/agrovet_shops_page.dart' as _i2;
import 'package:grnagain/src/screens/bookmarks.dart' as _i3;
import 'package:grnagain/src/screens/crops_details.dart' as _i4;
import 'package:grnagain/src/screens/crops_view.dart' as _i5;
import 'package:grnagain/src/screens/forecast_page.dart' as _i6;
import 'package:grnagain/src/screens/history_page.dart' as _i7;
import 'package:grnagain/src/screens/home.dart' as _i8;
import 'package:grnagain/src/screens/login.dart' as _i9;
import 'package:grnagain/src/screens/notifications.dart' as _i10;
import 'package:grnagain/src/screens/payment_confirm.dart' as _i11;
import 'package:grnagain/src/screens/predict.dart' as _i12;
import 'package:grnagain/src/screens/profile.dart' as _i13;
import 'package:grnagain/src/screens/purchase.dart' as _i14;
import 'package:grnagain/src/screens/settings.dart' as _i15;
import 'package:grnagain/src/screens/signup.dart' as _i16;
import 'package:grnagain/src/screens/solution.dart' as _i17;
import 'package:image_picker/image_picker.dart' as _i22;
import 'package:weather/weather.dart' as _i21;

/// generated route for
/// [_i1.AboutPage]
class AboutRoute extends _i18.PageRouteInfo<void> {
  const AboutRoute({List<_i18.PageRouteInfo>? children})
      : super(
          AboutRoute.name,
          initialChildren: children,
        );

  static const String name = 'AboutRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      return const _i1.AboutPage();
    },
  );
}

/// generated route for
/// [_i2.AgrovetShopsPage]
class AgrovetShopsRoute extends _i18.PageRouteInfo<void> {
  const AgrovetShopsRoute({List<_i18.PageRouteInfo>? children})
      : super(
          AgrovetShopsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AgrovetShopsRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      return const _i2.AgrovetShopsPage();
    },
  );
}

/// generated route for
/// [_i3.BookmarksPage]
class BookmarksRoute extends _i18.PageRouteInfo<void> {
  const BookmarksRoute({List<_i18.PageRouteInfo>? children})
      : super(
          BookmarksRoute.name,
          initialChildren: children,
        );

  static const String name = 'BookmarksRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      return const _i3.BookmarksPage();
    },
  );
}

/// generated route for
/// [_i4.CropsDetailsPage]
class CropsDetailsRoute extends _i18.PageRouteInfo<CropsDetailsRouteArgs> {
  CropsDetailsRoute({
    _i19.Key? key,
    required _i20.Crop model,
    List<_i18.PageRouteInfo>? children,
  }) : super(
          CropsDetailsRoute.name,
          args: CropsDetailsRouteArgs(
            key: key,
            model: model,
          ),
          initialChildren: children,
        );

  static const String name = 'CropsDetailsRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CropsDetailsRouteArgs>();
      return _i4.CropsDetailsPage(
        key: args.key,
        model: args.model,
      );
    },
  );
}

class CropsDetailsRouteArgs {
  const CropsDetailsRouteArgs({
    this.key,
    required this.model,
  });

  final _i19.Key? key;

  final _i20.Crop model;

  @override
  String toString() {
    return 'CropsDetailsRouteArgs{key: $key, model: $model}';
  }
}

/// generated route for
/// [_i5.CropsPage]
class CropsRoute extends _i18.PageRouteInfo<void> {
  const CropsRoute({List<_i18.PageRouteInfo>? children})
      : super(
          CropsRoute.name,
          initialChildren: children,
        );

  static const String name = 'CropsRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      return const _i5.CropsPage();
    },
  );
}

/// generated route for
/// [_i6.ForecastPage]
class ForecastRoute extends _i18.PageRouteInfo<ForecastRouteArgs> {
  ForecastRoute({
    _i19.Key? key,
    required List<_i21.Weather> forecast,
    List<_i18.PageRouteInfo>? children,
  }) : super(
          ForecastRoute.name,
          args: ForecastRouteArgs(
            key: key,
            forecast: forecast,
          ),
          initialChildren: children,
        );

  static const String name = 'ForecastRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ForecastRouteArgs>();
      return _i6.ForecastPage(
        key: args.key,
        forecast: args.forecast,
      );
    },
  );
}

class ForecastRouteArgs {
  const ForecastRouteArgs({
    this.key,
    required this.forecast,
  });

  final _i19.Key? key;

  final List<_i21.Weather> forecast;

  @override
  String toString() {
    return 'ForecastRouteArgs{key: $key, forecast: $forecast}';
  }
}

/// generated route for
/// [_i7.HistoryPage]
class HistoryRoute extends _i18.PageRouteInfo<void> {
  const HistoryRoute({List<_i18.PageRouteInfo>? children})
      : super(
          HistoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'HistoryRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      return const _i7.HistoryPage();
    },
  );
}

/// generated route for
/// [_i8.HomePage]
class HomeRoute extends _i18.PageRouteInfo<void> {
  const HomeRoute({List<_i18.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      return const _i8.HomePage();
    },
  );
}

/// generated route for
/// [_i9.LoginPage]
class LoginRoute extends _i18.PageRouteInfo<void> {
  const LoginRoute({List<_i18.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      return const _i9.LoginPage();
    },
  );
}

/// generated route for
/// [_i10.NotificationsPage]
class NotificationsRoute extends _i18.PageRouteInfo<void> {
  const NotificationsRoute({List<_i18.PageRouteInfo>? children})
      : super(
          NotificationsRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationsRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      return const _i10.NotificationsPage();
    },
  );
}

/// generated route for
/// [_i11.PaymentConfirmPage]
class PaymentConfirmRoute extends _i18.PageRouteInfo<void> {
  const PaymentConfirmRoute({List<_i18.PageRouteInfo>? children})
      : super(
          PaymentConfirmRoute.name,
          initialChildren: children,
        );

  static const String name = 'PaymentConfirmRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      return const _i11.PaymentConfirmPage();
    },
  );
}

/// generated route for
/// [_i12.PredictPage]
class PredictRoute extends _i18.PageRouteInfo<PredictRouteArgs> {
  PredictRoute({
    _i19.Key? key,
    required _i22.XFile image,
    List<_i18.PageRouteInfo>? children,
  }) : super(
          PredictRoute.name,
          args: PredictRouteArgs(
            key: key,
            image: image,
          ),
          initialChildren: children,
        );

  static const String name = 'PredictRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PredictRouteArgs>();
      return _i12.PredictPage(
        key: args.key,
        image: args.image,
      );
    },
  );
}

class PredictRouteArgs {
  const PredictRouteArgs({
    this.key,
    required this.image,
  });

  final _i19.Key? key;

  final _i22.XFile image;

  @override
  String toString() {
    return 'PredictRouteArgs{key: $key, image: $image}';
  }
}

/// generated route for
/// [_i13.ProfilePage]
class ProfileRoute extends _i18.PageRouteInfo<void> {
  const ProfileRoute({List<_i18.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      return const _i13.ProfilePage();
    },
  );
}

/// generated route for
/// [_i14.PurchasePage]
class PurchaseRoute extends _i18.PageRouteInfo<void> {
  const PurchaseRoute({List<_i18.PageRouteInfo>? children})
      : super(
          PurchaseRoute.name,
          initialChildren: children,
        );

  static const String name = 'PurchaseRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      return const _i14.PurchasePage();
    },
  );
}

/// generated route for
/// [_i15.SettingsPage]
class SettingsRoute extends _i18.PageRouteInfo<void> {
  const SettingsRoute({List<_i18.PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      return const _i15.SettingsPage();
    },
  );
}

/// generated route for
/// [_i16.SignupPage]
class SignupRoute extends _i18.PageRouteInfo<void> {
  const SignupRoute({List<_i18.PageRouteInfo>? children})
      : super(
          SignupRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignupRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      return const _i16.SignupPage();
    },
  );
}

/// generated route for
/// [_i17.SolutionPage]
class SolutionRoute extends _i18.PageRouteInfo<SolutionRouteArgs> {
  SolutionRoute({
    _i19.Key? key,
    required _i20.Crop model,
    List<_i18.PageRouteInfo>? children,
  }) : super(
          SolutionRoute.name,
          args: SolutionRouteArgs(
            key: key,
            model: model,
          ),
          initialChildren: children,
        );

  static const String name = 'SolutionRoute';

  static _i18.PageInfo page = _i18.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SolutionRouteArgs>();
      return _i17.SolutionPage(
        key: args.key,
        model: args.model,
      );
    },
  );
}

class SolutionRouteArgs {
  const SolutionRouteArgs({
    this.key,
    required this.model,
  });

  final _i19.Key? key;

  final _i20.Crop model;

  @override
  String toString() {
    return 'SolutionRouteArgs{key: $key, model: $model}';
  }
}
