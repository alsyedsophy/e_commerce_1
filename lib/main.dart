import 'package:flutter/material.dart';

import 'app/app.dart';
import 'core/dependency_injection/dependency_injection.dart';
import 'core/extensions/extensions.dart';
import 'core/localization/localization.dart';
import 'core/widgets/widgets.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initCore();
  await getIt<LocaleCubit>().loadLocale();
  runApp(App(home: const HomeScreen()));
}

/// Temporary landing screen used until the first feature is implemented.
///
/// It demonstrates the wired-in theme, localization and responsive helpers.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.tr('appName')),
        actions: const <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: LocaleToggle(),
          ),
        ],
      ),
      body: Center(
        child: Text(
          context.l10n.tr('emptyGeneric'),
          style: context.textTheme.bodyLarge,
        ),
      ),
    );
  }
}
