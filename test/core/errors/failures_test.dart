import 'package:flutter_test/flutter_test.dart';

import 'package:e_commerce_1/core/errors/errors.dart';

void main() {
  group('Failures', () {
    test('every failure is a Failure with a message and code', () {
      final List<Failure> failures = <Failure>[
        NetworkFailure(),
        ServerFailure(),
        CacheFailure(),
        AuthFailure(),
        ValidationFailure(),
        UnknownFailure(),
      ];

      for (final Failure failure in failures) {
        expect(failure, isA<Failure>());
        expect(failure.message, isNotEmpty);
        expect(failure.code, isNotNull);
      }
    });

    test('accepts a custom message', () {
      final ServerFailure failure = ServerFailure('Down for maintenance');
      expect(failure.message, 'Down for maintenance');
    });
  });
}
