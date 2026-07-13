import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

/// In-memory loader so the test does not depend on the physical asset bundle
/// (which `flutter test` does not always include). Mirrors
/// `assets/translations/*.json`.
class _TestAssetLoader extends AssetLoader {
  const _TestAssetLoader();

  static const Map<String, Map<String, String>> _data =
      <String, Map<String, String>>{
    'en': <String, String>{
      'appName': 'E-Commerce',
      'validationEmail': 'Enter a valid email address',
    },
    'ar': <String, String>{
      'appName': 'متجر إلكتروني',
      'validationEmail': 'أدخل بريداً إلكترونياً صحيحاً',
    },
  };

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) async =>
      _data[locale.languageCode];
}

class _TrView extends StatelessWidget {
  const _TrView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Text('appName'.tr()),
          Text('validationEmail'.tr()),
        ],
      ),
    );
  }
}

Widget _bootstrap(Locale start) => EasyLocalization(
      supportedLocales: const <Locale>[Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      useOnlyLangCode: true,
      assetLoader: const _TestAssetLoader(),
      startLocale: start,
      saveLocale: false,
      child: Builder(
        builder: (BuildContext context) => MaterialApp(
          locale: context.locale,
          supportedLocales: context.supportedLocales,
          localizationsDelegates: context.localizationDelegates,
          home: const _TrView(),
        ),
      ),
    );

void main() {
  testWidgets('resolves English translations', (WidgetTester tester) async {
    await tester.pumpWidget(_bootstrap(const Locale('en')));
    await tester.pumpAndSettle();

    expect(find.text('E-Commerce'), findsOneWidget);
    expect(find.text('Enter a valid email address'), findsOneWidget);
  });

  testWidgets('resolves Arabic translations', (WidgetTester tester) async {
    await tester.pumpWidget(_bootstrap(const Locale('ar')));
    await tester.pumpAndSettle();

    expect(find.text('متجر إلكتروني'), findsOneWidget);
  });

  testWidgets('switches locale at runtime', (WidgetTester tester) async {
    await tester.pumpWidget(_bootstrap(const Locale('en')));
    await tester.pumpAndSettle();
    expect(find.text('E-Commerce'), findsOneWidget);

    final BuildContext context = tester.element(find.byType(_TrView));
    context.setLocale(const Locale('ar'));
    await tester.pumpAndSettle();

    expect(find.text('متجر إلكتروني'), findsOneWidget);
  });
}
