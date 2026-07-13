import 'package:e_commerce_1/core/components/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:e_commerce_1/core/design_system/design_system.dart';

void main() {
  testWidgets('renders label and triggers onPressed', (
    WidgetTester tester,
  ) async {
    bool tapped = false;

    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.light,
        home: Scaffold(
          body: AppButton(label: 'Submit', onPressed: () => tapped = true),
        ),
      ),
    );

    expect(find.text('Submit'), findsOneWidget);
    await tester.tap(find.byType(AppButton));
    expect(tapped, isTrue);
  });

  testWidgets('disables interaction while loading', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.light,
        home: Scaffold(
          body: AppButton(label: 'Submit', isLoading: true, onPressed: () {}),
        ),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    final FilledButton button = tester.widget<FilledButton>(
      find.byType(FilledButton),
    );
    expect(button.onPressed, isNull);
  });

  testWidgets('renders secondary variant', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.light,
        home: Scaffold(
          body: AppButton(
            label: 'Cancel',
            variant: AppButtonVariant.secondary,
            onPressed: () {},
          ),
        ),
      ),
    );

    expect(find.byType(OutlinedButton), findsOneWidget);
    expect(find.text('Cancel'), findsOneWidget);
  });

  testWidgets('renders in dark theme', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.dark,
        home: Scaffold(
          body: AppButton(label: 'Submit', onPressed: () {}),
        ),
      ),
    );

    expect(find.text('Submit'), findsOneWidget);
    expect(
      tester.widget<MaterialApp>(find.byType(MaterialApp)).theme!.brightness,
      Brightness.dark,
    );
  });
}
