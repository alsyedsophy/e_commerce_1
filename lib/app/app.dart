import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../core/dependency_injection/dependency_injection.dart';
import '../core/design_system/design_system.dart';
import '../core/localization/localization.dart';
import '../core/routing/routing.dart';
import '../core/theme/theme.dart';

/// Root application widget.
///
/// Wires theming, localization and routing together. Business logic lives in
/// features; this widget only assembles infrastructure.
class App extends StatelessWidget {
  App({required Widget home, super.key}) : _router = AppRouter.create(home: home);

  final GoRouter _router;

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: supportedLocales,
      path: translationsPath,
      fallbackLocale: fallbackLocale,
      useOnlyLangCode: true,
      startLocale: getIt<LocaleCubit>().state.locale,
      child: BlocProvider<ThemeCubit>(
        create: (_) => getIt<ThemeCubit>()..loadTheme(),
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (BuildContext context, ThemeState themeState) {
            return BlocProvider<LocaleCubit>.value(
              value: getIt<LocaleCubit>(),
              child: MaterialApp.router(
                debugShowCheckedModeBanner: false,
                locale: context.locale,
                supportedLocales: context.supportedLocales,
                localizationsDelegates: context.localizationDelegates,
                onGenerateTitle: (BuildContext context) =>
                    context.l10n.tr('appName'),
                theme: AppTheme.light,
                darkTheme: AppTheme.dark,
                themeMode: themeState.themeMode,
                routerConfig: _router,
              ),
            );
          },
        ),
      ),
    );
  }
}
