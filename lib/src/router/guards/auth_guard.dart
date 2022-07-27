// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthGuard extends AutoRouteGuard {
  final WidgetRef ref;

  final PendingDynamicLinkData? initialLink;
  AuthGuard({
    required this.ref,
    this.initialLink,
  });

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    // final user = ref.watch(firebaseAuthRiverpod).getAuthUser;
    if (initialLink != null) {
      final Uri deepLink = initialLink!.link;
      if (deepLink.path.contains('payment')) {
        router.pushNamed(deepLink.path);
      }
    }
    FirebaseDynamicLinks.instance.onLink.listen((dynamicLinkData) {
      router.pushNamed(dynamicLinkData.link.path);
    }).onError((error) {
      // Handle errors
    });
    FirebaseAuth.instance.authStateChanges().listen(
      (state) {
        //debugPrint('auth state changed => $state');

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
