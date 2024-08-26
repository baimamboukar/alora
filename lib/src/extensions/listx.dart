import 'package:flutter/material.dart';

extension X on List<Widget> {
  List<Widget> seperateBy(Widget seperator) {
    final widgets = <Widget>[];
    for (var i = 0; i < length; i++) {
      widgets.add(this[i]);
      if (i != length - 1) widgets.add(seperator);
    }
    return widgets;
  }
}
