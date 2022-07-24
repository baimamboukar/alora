import 'package:hive/hive.dart';

class SettingsBox {
  static bool get isDarkTheme => Hive.box<dynamic>('settings').get('theme');
  static set setDarkTheme(bool isDark) =>
      Hive.box<dynamic>('settings').put('theme', isDark);
  static String get activeLanguage =>
      Hive.box<String>('settings').get('language') ?? 'en';
  static set setActiveLanguage(String locale) =>
      Hive.box<String>('settings').put('language', locale);
}
