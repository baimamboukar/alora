// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:alora/src/screens/payment_confirm.dart' as confirm;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:alora/src/configs/index.dart';
import 'package:alora/src/router/guards/index.dart';
import 'package:alora/src/router/router.gr.dart';

import 'firebase_options.dart';

final appKeyProvider = Provider<GlobalKey>((ref) {
  return GlobalKey();
});
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Firebase.initializeApp(
    name: 'Alora',
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  // await Hive.deleteBoxFromDisk('settings');
  // await Hive.deleteBoxFromDisk('user');
  await Hive.openBox<dynamic>('settings');
  await Hive.openBox('user');
  Hive.box('settings').isEmpty
      ? {
          Hive.box('settings').put('language', 'en'),
          Hive.box('settings').put('theme', false),
        }
      : null;
  final PendingDynamicLinkData? initialLink =
      await FirebaseDynamicLinks.instance.getInitialLink();
  runApp(ProviderScope(child: Alora(initialLink: initialLink)));
}

class Alora extends ConsumerStatefulWidget {
  final PendingDynamicLinkData? initialLink;
  const Alora({
    Key? key,
    this.initialLink,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AloraState();
}

class _AloraState extends ConsumerState<Alora> {
  late AppRouter appRouter;
  @override
  void initState() {
    appRouter = AppRouter(authGuard: AuthGuard(ref: ref));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box<dynamic>('settings').listenable(),
      builder: (context, Box box, widget) => MaterialApp.router(
        builder: EasyLoading.init(),
        routerDelegate: appRouter.delegate(),
        routeInformationParser: appRouter.defaultRouteParser(),
        restorationScopeId: 'app',
        locale: const Locale('en-US'),
        debugShowCheckedModeBanner: false,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        title: 'Alora',
        themeMode: box.get('theme') ? ThemeMode.dark : ThemeMode.light,
        darkTheme: ThemeData.dark(),
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
