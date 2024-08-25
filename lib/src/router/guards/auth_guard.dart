// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:grnagain/src/router/router.gr.dart';

class AuthGuard extends AutoRouteGuard {
  AuthGuard();
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final user = FirebaseAuth.instance.currentUser?.uid;

    if (user != null) {
      resolver.next(true);
    } else {
      resolver.next(false);
      router.push(const LoginRoute());
    }
  }
}
