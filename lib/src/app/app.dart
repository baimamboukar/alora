// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grnagain/i18n/strings.g.dart';
import 'package:grnagain/src/configs/index.dart';
import 'package:grnagain/src/router/router.dart';
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
        routerDelegate: appRouter.delegate(),
        routeInformationParser: appRouter.defaultRouteParser(),
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
