import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Alora', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const Alora());

    // Verify that our counter starts at 0.
    expect(find.text('1'), findsNothing);
  });
}
