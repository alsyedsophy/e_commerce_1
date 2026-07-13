import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:e_commerce_1/core/design_system/design_system.dart';

void main() {
  test('light theme builds with material3 and light brightness', () {
    final ThemeData theme = AppTheme.light;

    expect(theme.useMaterial3, isTrue);
    expect(theme.brightness, Brightness.light);
  });

  test('dark theme builds with dark brightness', () {
    final ThemeData theme = AppTheme.dark;

    expect(theme.brightness, Brightness.dark);
  });

  test('text theme exposes all required roles', () {
    final TextTheme textTheme = AppTheme.light.textTheme;

    expect(textTheme.displayLarge, isNotNull);
    expect(textTheme.headlineMedium, isNotNull);
    expect(textTheme.titleLarge, isNotNull);
    expect(textTheme.bodyLarge, isNotNull);
    expect(textTheme.bodyMedium, isNotNull);
    expect(textTheme.labelMedium, isNotNull);
  });

  test('color scheme exposes brand and error tokens', () {
    final ColorScheme colorScheme = AppTheme.light.colorScheme;

    expect(colorScheme.primary, isNotNull);
    expect(colorScheme.error, isNotNull);
  });

  test('button themes apply the medium radius', () {
    expect(
      AppTheme.light.filledButtonTheme.style?.shape?.resolve(<WidgetState>{}),
      isA<RoundedRectangleBorder>(),
    );
  });
}
