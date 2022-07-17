import 'package:flutter/material.dart' show Locale;
import 'package:hive/hive.dart';

class SettingsBox {
  static bool get isDarkTheme => Hive.box<dynamic>('settings').get('theme');
  static set setDarkTheme(bool isDark) =>
      Hive.box<dynamic>('settings').put('theme', isDark);
  static Locale get activeLanguage =>
      Hive.box<Locale>('settings').get('language') ?? const Locale('en', 'US');
  static set setActiveLanguage(Locale locale) =>
      Hive.box<Locale>('settings').put('language', locale);
}
