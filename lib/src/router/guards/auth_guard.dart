import 'package:alora/src/riverpods/auth_riverpods.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthGuard extends AutoRouteGuard {
  final WidgetRef ref;

  AuthGuard({required this.ref});

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final user = ref.read(firebaseAuthRiverpod).isSignedIn;
    user ? resolver.next(true) : resolver.next(true);
  }
}
