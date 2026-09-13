import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:swapit/main.dart';

void main() {
  testWidgets('SwapIt app launches to the login screen', (WidgetTester tester) async {
    await tester.pumpWidget(const SwapItApp());

    expect(find.text('Welcome back'), findsOneWidget);
    expect(find.widgetWithText(ElevatedButton, 'Log In'), findsOneWidget);
  });
}
