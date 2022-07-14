import 'package:alora/src/configs/index.dart';
import 'package:alora/src/router/guards/index.dart';
import 'package:alora/src/router/router.gr.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import 'firebase_options.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Firebase.initializeApp(
    name: 'Alora',
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: Alora()));
}

class Alora extends ConsumerStatefulWidget {
  const Alora({Key? key}) : super(key: key);

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
    return MaterialApp.router(
      builder: EasyLoading.init(),
      routerDelegate: appRouter.delegate(),
      routeInformationParser: appRouter.defaultRouteParser(),
      restorationScopeId: 'app',
      locale: const Locale('en-US'),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      title: 'Alora',
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
    );
  }
}
