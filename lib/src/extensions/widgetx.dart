import 'package:flutter/material.dart';

extension WidgetX on Widget {
  Widget get shrink => const SizedBox.shrink();
  Widget get hPadding => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: this,
      );
  Widget get vPadding => Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: this,
      );
  Widget vPaddingx(double x) => Padding(
        padding: EdgeInsets.symmetric(vertical: x),
        child: this,
      );
  Widget hPaddingx(double x) => Padding(
        padding: EdgeInsets.symmetric(horizontal: x),
        child: this,
      );
  Widget get center => Align(
        child: this,
      );

  Widget get floatR => Align(
        alignment: Alignment.centerRight,
        child: this,
      );
  Widget floatX({required bool left}) => Align(
        alignment: left ? Alignment.centerLeft : Alignment.centerRight,
        child: this,
      );
  Widget get shiftR => Row(
        children: [this],
      );

  Widget get floatL => Align(
        alignment: Alignment.centerLeft,
        child: this,
      );
  Widget get floatC => Align(
        child: this,
      );
}

extension TextX on Text {
  Text get format {
    return Text.rich(
      _parseStyledText(data ?? ''),
      style: style,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }

  TextSpan _parseStyledText(String text) {
    final children = <TextSpan>[];
    final exp = RegExp(r'(\*\*[^*]+\*\*|_[^_]+_)');
    final Iterable<Match> matches = exp.allMatches(text);

    var lastMatchEnd = 0;

    for (final match in matches) {
      if (match.start > lastMatchEnd) {
        children.add(TextSpan(text: text.substring(lastMatchEnd, match.start)));
      }

      final matchText = match.group(0)!;
      if (matchText.startsWith('**') && matchText.endsWith('**')) {
        children.add(
          TextSpan(
            text: matchText.substring(2, matchText.length - 2),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        );
      } else if (matchText.startsWith('_') && matchText.endsWith('_')) {
        children.add(
          TextSpan(
            text: matchText.substring(1, matchText.length - 1),
            style: const TextStyle(fontStyle: FontStyle.italic),
          ),
        );
      }

      lastMatchEnd = match.end;
    }

    if (lastMatchEnd < text.length) {
      children.add(TextSpan(text: text.substring(lastMatchEnd)));
    }

    return TextSpan(children: children);
  }
}
