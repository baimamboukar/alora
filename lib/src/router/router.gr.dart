// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i16;
import 'package:flutter/material.dart' as _i17;
import 'package:grnagain/src/models/crop_model.dart' as _i18;
import 'package:grnagain/src/screens/agrovet_shops_page.dart' as _i1;
import 'package:grnagain/src/screens/bookmarks.dart' as _i2;
import 'package:grnagain/src/screens/crops_details.dart' as _i3;
import 'package:grnagain/src/screens/crops_view.dart' as _i4;
import 'package:grnagain/src/screens/history_page.dart' as _i5;
import 'package:grnagain/src/screens/home.dart' as _i6;
import 'package:grnagain/src/screens/login.dart' as _i7;
import 'package:grnagain/src/screens/notifications.dart' as _i8;
import 'package:grnagain/src/screens/payment_confirm.dart' as _i9;
import 'package:grnagain/src/screens/predict.dart' as _i10;
import 'package:grnagain/src/screens/profile.dart' as _i11;
import 'package:grnagain/src/screens/purchase.dart' as _i12;
import 'package:grnagain/src/screens/settings.dart' as _i13;
import 'package:grnagain/src/screens/signup.dart' as _i14;
import 'package:grnagain/src/screens/solution.dart' as _i15;
import 'package:image_picker/image_picker.dart' as _i19;

/// generated route for
/// [_i1.AgrovetShopsPage]
class AgrovetShopsRoute extends _i16.PageRouteInfo<void> {
  const AgrovetShopsRoute({List<_i16.PageRouteInfo>? children})
      : super(
          AgrovetShopsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AgrovetShopsRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i1.AgrovetShopsPage();
    },
  );
}

/// generated route for
/// [_i2.BookmarksPage]
class BookmarksRoute extends _i16.PageRouteInfo<void> {
  const BookmarksRoute({List<_i16.PageRouteInfo>? children})
      : super(
          BookmarksRoute.name,
          initialChildren: children,
        );

  static const String name = 'BookmarksRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i2.BookmarksPage();
    },
  );
}

/// generated route for
/// [_i3.CropsDetailsPage]
class CropsDetailsRoute extends _i16.PageRouteInfo<CropsDetailsRouteArgs> {
  CropsDetailsRoute({
    _i17.Key? key,
    required _i18.Crop model,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          CropsDetailsRoute.name,
          args: CropsDetailsRouteArgs(
            key: key,
            model: model,
          ),
          initialChildren: children,
        );

  static const String name = 'CropsDetailsRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CropsDetailsRouteArgs>();
      return _i3.CropsDetailsPage(
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

  final _i17.Key? key;

  final _i18.Crop model;

  @override
  String toString() {
    return 'CropsDetailsRouteArgs{key: $key, model: $model}';
  }
}

/// generated route for
/// [_i4.CropsPage]
class CropsRoute extends _i16.PageRouteInfo<void> {
  const CropsRoute({List<_i16.PageRouteInfo>? children})
      : super(
          CropsRoute.name,
          initialChildren: children,
        );

  static const String name = 'CropsRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i4.CropsPage();
    },
  );
}

/// generated route for
/// [_i5.HistoryPage]
class HistoryRoute extends _i16.PageRouteInfo<void> {
  const HistoryRoute({List<_i16.PageRouteInfo>? children})
      : super(
          HistoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'HistoryRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i5.HistoryPage();
    },
  );
}

/// generated route for
/// [_i6.HomePage]
class HomeRoute extends _i16.PageRouteInfo<void> {
  const HomeRoute({List<_i16.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i6.HomePage();
    },
  );
}

/// generated route for
/// [_i7.LoginPage]
class LoginRoute extends _i16.PageRouteInfo<void> {
  const LoginRoute({List<_i16.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i7.LoginPage();
    },
  );
}

/// generated route for
/// [_i8.NotificationsPage]
class NotificationsRoute extends _i16.PageRouteInfo<void> {
  const NotificationsRoute({List<_i16.PageRouteInfo>? children})
      : super(
          NotificationsRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationsRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i8.NotificationsPage();
    },
  );
}

/// generated route for
/// [_i9.PaymentConfirmPage]
class PaymentConfirmRoute extends _i16.PageRouteInfo<void> {
  const PaymentConfirmRoute({List<_i16.PageRouteInfo>? children})
      : super(
          PaymentConfirmRoute.name,
          initialChildren: children,
        );

  static const String name = 'PaymentConfirmRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i9.PaymentConfirmPage();
    },
  );
}

/// generated route for
/// [_i10.PredictPage]
class PredictRoute extends _i16.PageRouteInfo<PredictRouteArgs> {
  PredictRoute({
    _i17.Key? key,
    required _i19.XFile image,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          PredictRoute.name,
          args: PredictRouteArgs(
            key: key,
            image: image,
          ),
          initialChildren: children,
        );

  static const String name = 'PredictRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PredictRouteArgs>();
      return _i10.PredictPage(
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

  final _i17.Key? key;

  final _i19.XFile image;

  @override
  String toString() {
    return 'PredictRouteArgs{key: $key, image: $image}';
  }
}

/// generated route for
/// [_i11.ProfilePage]
class ProfileRoute extends _i16.PageRouteInfo<void> {
  const ProfileRoute({List<_i16.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i11.ProfilePage();
    },
  );
}

/// generated route for
/// [_i12.PurchasePage]
class PurchaseRoute extends _i16.PageRouteInfo<void> {
  const PurchaseRoute({List<_i16.PageRouteInfo>? children})
      : super(
          PurchaseRoute.name,
          initialChildren: children,
        );

  static const String name = 'PurchaseRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i12.PurchasePage();
    },
  );
}

/// generated route for
/// [_i13.SettingsPage]
class SettingsRoute extends _i16.PageRouteInfo<void> {
  const SettingsRoute({List<_i16.PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i13.SettingsPage();
    },
  );
}

/// generated route for
/// [_i14.SignupPage]
class SignupRoute extends _i16.PageRouteInfo<void> {
  const SignupRoute({List<_i16.PageRouteInfo>? children})
      : super(
          SignupRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignupRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i14.SignupPage();
    },
  );
}

/// generated route for
/// [_i15.SolutionPage]
class SolutionRoute extends _i16.PageRouteInfo<SolutionRouteArgs> {
  SolutionRoute({
    _i17.Key? key,
    required _i18.Crop model,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          SolutionRoute.name,
          args: SolutionRouteArgs(
            key: key,
            model: model,
          ),
          initialChildren: children,
        );

  static const String name = 'SolutionRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SolutionRouteArgs>();
      return _i15.SolutionPage(
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

  final _i17.Key? key;

  final _i18.Crop model;

  @override
  String toString() {
    return 'SolutionRouteArgs{key: $key, model: $model}';
  }
}
