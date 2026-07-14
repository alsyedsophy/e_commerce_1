import 'package:e_commerce_1/core/design_system/design_system.dart';
import 'package:e_commerce_1/core/localization/localization.dart';
import 'package:e_commerce_1/core/responsive/responsive.dart';
import 'package:flutter/material.dart';

/// Shared responsive shell for the authentication screens.
///
/// Centers a width-capped card (scales per breakpoint) containing the form.
/// All user-facing text is provided localized by the caller.
class AuthScaffold extends StatelessWidget {
  const AuthScaffold({
    required this.title,
    required this.child,
    super.key,
  });

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final double maxWidth = AppResponsive.value(
      context,
      mobile: 420,
      tablet: 480,
      desktop: 520,
    );

    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.tr('appName'))),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: maxWidth),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(title, style: theme.textTheme.headlineSmall),
                    const SizedBox(height: AppSpacing.lg),
                    child,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
