import 'package:flutter/material.dart';

extension NumX on num {
  /// Extension methods for [num] to convert to Gap between widgets.

  SizedBox get vGap => SizedBox(height: toDouble());
  SizedBox get hGap => SizedBox(width: toDouble());
}
