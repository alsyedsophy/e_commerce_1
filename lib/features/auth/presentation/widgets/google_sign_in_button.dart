import 'package:e_commerce_1/core/components/components.dart';
import 'package:e_commerce_1/core/localization/localization.dart';
import 'package:flutter/material.dart';

/// Secondary button that starts the Google sign-in flow.
///
/// Used by both the login and register screens, hence extracted to its own
/// feature widget.
class GoogleSignInButton extends StatelessWidget {
  const GoogleSignInButton({
    required this.onPressed,
    this.isLoading = false,
    super.key,
  });

  final VoidCallback? onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return AppButton(
      label: context.l10n.tr('continueWithGoogle'),
      onPressed: onPressed,
      isLoading: isLoading,
      variant: AppButtonVariant.secondary,
      isFullWidth: true,
    );
  }
}
