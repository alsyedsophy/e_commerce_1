import 'package:e_commerce_1/core/localization/localization.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../core/storage/storage_test.dart';

void main() {
  test('defaults to English and persists a new selection', () async {
    final FakeStorageService storage = FakeStorageService();
    final LocaleCubit cubit = LocaleCubit(storage);

    expect(cubit.state.locale.languageCode, 'en');
    expect(cubit.state.isRtl, isFalse);

    await cubit.setLocale(const Locale('ar'));
    expect(cubit.state.locale.languageCode, 'ar');
    expect(cubit.state.isRtl, isTrue);
    expect(await storage.getLocale(), 'ar');

    // No-op when the same locale is selected again.
    await cubit.setLocale(const Locale('ar'));
    expect(cubit.state.locale.languageCode, 'ar');

    cubit.close();
  });

  test('ignores unsupported locales', () async {
    final FakeStorageService storage = FakeStorageService();
    final LocaleCubit cubit = LocaleCubit(storage);

    await cubit.setLocale(const Locale('fr'));
    expect(cubit.state.locale.languageCode, 'en');
    expect(await storage.getLocale(), isNull);

    cubit.close();
  });

  test('loadLocale restores the saved locale', () async {
    final FakeStorageService storage = FakeStorageService();
    await storage.setLocale('ar');

    final LocaleCubit cubit = LocaleCubit(storage);
    await cubit.loadLocale();

    expect(cubit.state.locale.languageCode, 'ar');
    cubit.close();
  });
}
