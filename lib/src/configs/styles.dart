import 'package:flutter/material.dart';

class Styles {
  static TextStyle subtitle = const TextStyle(
      color: Colors.black45, fontWeight: FontWeight.bold, fontSize: 18.5);

  static TextStyle simple = const TextStyle(
      color: Colors.white, fontWeight: FontWeight.normal, fontSize: 15.0);

  static TextStyle designText(
          {required Color color, required double size, required bool bold}) =>
      TextStyle(
          color: color,
          fontWeight: bold ? FontWeight.bold : FontWeight.normal,
          fontSize: size);
}
