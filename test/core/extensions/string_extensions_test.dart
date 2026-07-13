import 'package:flutter_test/flutter_test.dart';

import 'package:e_commerce_1/core/extensions/extensions.dart';

void main() {
  group('StringExtensions', () {
    test('isBlank / isNotBlank', () {
      expect('   '.isBlank, isTrue);
      expect('a'.isBlank, isFalse);
      expect('a'.isNotBlank, isTrue);
    });

    test('isValidEmail', () {
      expect('user@example.com'.isValidEmail, isTrue);
      expect('nope'.isValidEmail, isFalse);
    });

    test('toIntOrNull', () {
      expect('42'.toIntOrNull(), 42);
      expect('x'.toIntOrNull(), isNull);
    });
  });
}
