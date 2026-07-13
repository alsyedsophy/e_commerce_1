import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:e_commerce_1/core/theme/theme.dart';

import '../../core/storage/storage_test.dart';

void main() {
  test('starts at system and persists mode changes', () async {
    final FakeStorageService storage = FakeStorageService();
    final ThemeCubit cubit = ThemeCubit(storage);

    expect(cubit.state.themeMode, ThemeMode.system);

    await cubit.setThemeMode(ThemeMode.dark);
    expect(cubit.state.themeMode, ThemeMode.dark);
    expect(await storage.getThemeMode(), ThemeMode.dark);

    await cubit.setThemeMode(ThemeMode.light);
    expect(cubit.state.themeMode, ThemeMode.light);

    cubit.close();
  });
}
