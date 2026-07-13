import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:e_commerce_1/core/design_system/design_system.dart';

void main() {
  group('AppColors', () {
    test('defines brand and semantic color tokens', () {
      expect(AppColors.brand, isA<Color>());
      expect(AppColors.success, isA<Color>());
      expect(AppColors.onSuccess, isA<Color>());
      expect(AppColors.warning, isA<Color>());
      expect(AppColors.onWarning, isA<Color>());
    });
  });

  group('AppSpacing', () {
    test('scales monotonically from xs to xl', () {
      expect(AppSpacing.xs < AppSpacing.sm, isTrue);
      expect(AppSpacing.sm < AppSpacing.md, isTrue);
      expect(AppSpacing.md < AppSpacing.lg, isTrue);
      expect(AppSpacing.lg < AppSpacing.xl, isTrue);
    });
  });

  group('AppRadius', () {
    test('full radius is the largest and helpers return BorderRadius', () {
      expect(AppRadius.full > AppRadius.xl, isTrue);
      expect(AppRadius.full > AppRadius.lg, isTrue);
      expect(AppRadius.smRadius, isA<BorderRadius>());
      expect(AppRadius.mdRadius, isA<BorderRadius>());
      expect(AppRadius.lgRadius, isA<BorderRadius>());
    });
  });
}
