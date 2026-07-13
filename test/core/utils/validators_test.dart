import 'package:flutter_test/flutter_test.dart';

import 'package:e_commerce_1/core/utils/utils.dart';

void main() {
  group('AppValidators.required', () {
    test('fails on empty and passes on value', () {
      expect(AppValidators.required(''), 'validationRequired');
      expect(AppValidators.required('  '), 'validationRequired');
      expect(AppValidators.required('value'), isNull);
    });
  });

  group('AppValidators.email', () {
    test('rejects invalid and accepts valid addresses', () {
      expect(AppValidators.email('not-an-email'), 'validationEmail');
      expect(AppValidators.email(''), 'validationRequired');
      expect(AppValidators.email('user@example.com'), isNull);
    });
  });

  group('AppValidators.password', () {
    test('enforces minimum length', () {
      expect(AppValidators.password('short'), 'validationPassword');
      expect(AppValidators.password('longenough'), isNull);
    });
  });

  group('AppValidators.confirmPassword', () {
    test('matches against the original password', () {
      expect(
        AppValidators.confirmPassword('a', 'b'),
        'validationConfirmPassword',
      );
      expect(AppValidators.confirmPassword('same', 'same'), isNull);
    });
  });
}
