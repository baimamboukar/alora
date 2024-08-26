// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grnagain/i18n/strings.g.dart';
import 'package:grnagain/src/configs/index.dart';
import 'package:grnagain/src/router/router.dart';
import 'package:grnagain/src/router/router.gr.dart';
import 'package:hive_flutter/hive_flutter.dart';

class GrnAgain extends ConsumerStatefulWidget {
  const GrnAgain({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _GrnAgainState();
}

class _GrnAgainState extends ConsumerState<GrnAgain> {
  late AppRouter appRouter;
  @override
  void initState() {
    appRouter = AppRouter();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box<dynamic>('settings').listenable(),
      builder: (context, Box box, widget) => MaterialApp.router(
        builder: EasyLoading.init(),
        locale: TranslationProvider.of(context).flutterLocale,
        routerConfig: appRouter.config(
          placeholder: (context) => const Center(
            child: CupertinoActivityIndicator(),
          ),
          rebuildStackOnDeepLink: true,
          deepLinkBuilder: (link) {
            if (link.path.contains('payment-confirm')) {
              final args = link.uri.queryParameters;
              //final invitation = Invitation.fromMap(args, fromInvite: true);
              return const DeepLink(
                [
                  PaymentConfirmRoute(),
                ],
              );
            } else {
              return DeepLink.defaultPath;
            }
          },
        ),
        restorationScopeId: 'app',
        debugShowCheckedModeBanner: false,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        title: 'grnagain',
        themeMode: box.get('theme') ? ThemeMode.dark : ThemeMode.light,
        darkTheme: AppTheme.dark,
        theme: AppTheme.light,
      ),
    );
  }
}
