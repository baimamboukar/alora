import 'package:alora/src/riverpods/auth_riverpods.dart';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthGuard extends AutoRouteGuard {
  final WidgetRef ref;

  AuthGuard({required this.ref});

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    // final user = ref.watch(firebaseAuthRiverpod).getAuthUser;
    FirebaseAuth.instance.authStateChanges().listen(
      (state) {
        debugPrint('auth state changed => $state');

        state != null
            ? {
                resolver.next(),
              }
            : router.replaceNamed('/signup');
      },
      onError: (err) {
        EasyLoading.showError("Something went wrong");
      },
      onDone: () {
        EasyLoading.showInfo("Done");
      },
    );
  }
}
