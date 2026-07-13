import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:e_commerce_1/core/storage/storage.dart';

/// In-memory [StorageService] used to test consumers without a device.
class FakeStorageService implements StorageService {
  final Map<String, Object> _data = <String, Object>{};

  @override
  Future<String?> getString(String key) async => _data[key] as String?;

  @override
  Future<void> setString(String key, String value) async => _data[key] = value;

  @override
  Future<bool?> getBool(String key) async => _data[key] as bool?;

  @override
  Future<void> setBool(String key, bool value) async => _data[key] = value;

  @override
  Future<void> remove(String key) async => _data.remove(key);

  @override
  Future<void> clear() async => _data.clear();

  @override
  Future<ThemeMode?> getThemeMode() async {
    final String? value = _data['app_theme_mode'] as String?;
    if (value == null) return null;
    return ThemeMode.values.firstWhere(
      (ThemeMode m) => m.name == value,
      orElse: () => ThemeMode.system,
    );
  }

  @override
  Future<void> setThemeMode(ThemeMode mode) async =>
      _data['app_theme_mode'] = mode.name;

  @override
  Future<String?> getLocale() async => _data['app_locale'] as String?;

  @override
  Future<void> setLocale(String languageCode) async =>
      _data['app_locale'] = languageCode;
}

void main() {
  test('persists and reads back theme mode and locale', () async {
    final FakeStorageService storage = FakeStorageService();

    expect(await storage.getThemeMode(), isNull);

    await storage.setThemeMode(ThemeMode.dark);
    expect(await storage.getThemeMode(), ThemeMode.dark);

    await storage.setLocale('ar');
    expect(await storage.getLocale(), 'ar');

    await storage.setString('token', 'abc');
    expect(await storage.getString('token'), 'abc');

    await storage.clear();
    expect(await storage.getThemeMode(), isNull);
  });
}
