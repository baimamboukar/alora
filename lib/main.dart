// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:grnagain/i18n/strings.g.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:grnagain/src/configs/index.dart';
import 'package:grnagain/src/router/guards/index.dart';
import 'package:grnagain/src/router/router.gr.dart';

import 'firebase_options.dart';

final appKeyProvider = Provider<GlobalKey>((ref) {
  return GlobalKey();
});
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Firebase.initializeApp(
    name: 'grnagain',
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  await Hive.openBox<dynamic>('settings');
  //Hive.box('settings').put('language', 'English');
  //await Hive.openBox<dynamic>('bookmarks');
  await Hive.openBox<dynamic>('user');
  Hive.box('user').isEmpty
      ? {
          Hive.box('user').put('bookmarks', <String>[]),
        }
      : null;
  Hive.box('settings').isEmpty
      ? {
          Hive.box('settings').put('language', 'English'),
          Hive.box('settings').put('theme', false),
        }
      : null;

  final PendingDynamicLinkData? initialLink =
      await FirebaseDynamicLinks.instance.getInitialLink();

  final locale = Hive.box('settings').get('language');
  if (locale == 'English') {
    LocaleSettings.setLocale(AppLocale.en);
  }
  if (locale == 'Deutsch') {
    LocaleSettings.setLocale(AppLocale.de);
  }
  if (locale == 'French') {
    LocaleSettings.setLocale(AppLocale.fr);
  }

  runApp(ProviderScope(
      child: TranslationProvider(child: GrnAgain(initialLink: initialLink))));
}

class GrnAgain extends ConsumerStatefulWidget {
  final PendingDynamicLinkData? initialLink;
  const GrnAgain({
    Key? key,
    this.initialLink,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _GrnAgainState();
}

class _GrnAgainState extends ConsumerState<GrnAgain> {
  late AppRouter appRouter;
  @override
  void initState() {
    appRouter = AppRouter(
        authGuard: AuthGuard(ref: ref, initialLink: widget.initialLink));
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
        darkTheme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.black26,
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              backgroundColor: Colors.black12),
          typography: Typography.material2021(),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: GoogleFonts.poppinsTextTheme(
            const TextTheme()
                .apply(bodyColor: Palette.light, displayColor: Palette.light),
          ),
        ),
        theme: ThemeData(
          useMaterial3: true,
          typography: Typography.material2021(),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: GoogleFonts.poppinsTextTheme(
            const TextTheme()
                .apply(bodyColor: Palette.light, displayColor: Palette.light),
          ),
          primarySwatch: const MaterialColor(0xFF337669, {
            100: Color(0xFF337669),
            700: Color(0xFFEEC36D),
            600: Color(0xFF337669),
            200: Color(0xFFEEC36D),
            500: Color(0xFF337669),
            400: Color(0xFFEEC36D),
            50: Color(0xFF337669),
            300: Color(0xFFEEC36D),
          }),
          iconTheme: const IconThemeData(color: Palette.primary, size: 22.0),
        ),
      ),
    );
  }
}
