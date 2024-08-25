// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grnagain/i18n/strings.g.dart';
import 'package:grnagain/src/app/app.dart';
import 'package:hive_flutter/hive_flutter.dart';

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

  runApp(
    ProviderScope(
      child: TranslationProvider(
        child: const GrnAgain(),
      ),
    ),
  );
}
