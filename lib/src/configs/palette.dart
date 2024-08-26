import 'package:flex_seed_scheme/flex_seed_scheme.dart';
import 'package:flutter/material.dart';

class Palette {
  static const Color primary = Color(0xFF337669);
  static const Color secondary = Color(0xFFA1A1A1);
  static const Color light = Color(0xFFEAEAEA);
  static const Color dark = Color(0xFF797D7A);
  static const Color danger = Color.fromARGB(255, 250, 12, 12);
}

class AppTheme {
  static ThemeData get light => _getTheme(Brightness.light);
  static ThemeData get dark => _getTheme(Brightness.dark);
}

ThemeData _getTheme(Brightness brightness) => ThemeData(
      useMaterial3: true,
      brightness: brightness,
      fontFamily: 'GoogleSans',
      colorScheme: SeedColorScheme.fromSeeds(
        brightness: brightness,
        primary: const Color(0xFF337669),
        primaryKey: const Color(0xFF337669),
        secondary: const Color(0xFF797D7A),
        tertiary: const Color(0xFF797D7A),
        surface: const Color(0xFFEBEBEB),
        tones: FlexTones.vivid(brightness),
      ),
    );
