import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:e_commerce_1/core/design_system/design_system.dart';
import 'package:e_commerce_1/core/widgets/widgets.dart';

void main() {
  testWidgets('renders the provided message', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.light,
        home: const Scaffold(body: AppEmptyView(message: 'No items')),
      ),
    );

    expect(find.text('No items'), findsOneWidget);
  });
}
