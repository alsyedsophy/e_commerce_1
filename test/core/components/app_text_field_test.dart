import 'package:e_commerce_1/core/components/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:e_commerce_1/core/design_system/design_system.dart';

void main() {
  testWidgets('shows label and captures input', (WidgetTester tester) async {
    final TextEditingController controller = TextEditingController();

    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.light,
        home: Scaffold(
          body: AppTextField(controller: controller, label: 'Email'),
        ),
      ),
    );

    expect(find.text('Email'), findsOneWidget);
    await tester.enterText(find.byType(EditableText), 'test@example.com');
    expect(controller.text, 'test@example.com');
  });

  testWidgets('validates input through the provided validator', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.light,
        home: Scaffold(
          body: Form(
            child: AppTextField(
              label: 'Email',
              validator: (String? value) =>
                  value == null || value.isEmpty ? 'Required' : null,
            ),
          ),
        ),
      ),
    );

    final FormState form = tester.state<FormState>(find.byType(Form));
    expect(form.validate(), isFalse);
  });
}
