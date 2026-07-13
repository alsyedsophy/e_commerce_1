import 'package:e_commerce_1/core/components/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:e_commerce_1/core/design_system/design_system.dart';
import 'package:e_commerce_1/core/widgets/widgets.dart';

void main() {
  testWidgets('shows message and triggers retry tap', (
    WidgetTester tester,
  ) async {
    bool retried = false;

    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.light,
        home: Scaffold(
          body: AppErrorView(
            message: 'Boom',
            retryLabel: 'Retry',
            onRetry: () => retried = true,
          ),
        ),
      ),
    );

    expect(find.text('Boom'), findsOneWidget);
    expect(find.widgetWithText(AppButton, 'Retry'), findsOneWidget);

    await tester.tap(find.widgetWithText(AppButton, 'Retry'));
    expect(retried, isTrue);
  });

  testWidgets('does not show a button without label and callback', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.light,
        home: const Scaffold(body: AppErrorView(message: 'Boom')),
      ),
    );

    expect(find.widgetWithText(AppButton, 'Retry'), findsNothing);
  });
}
