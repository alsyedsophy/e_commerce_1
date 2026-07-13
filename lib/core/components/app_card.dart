import 'package:flutter/material.dart';

import '../design_system/app_elevation.dart';
import '../design_system/app_spacing.dart';

/// Design-system card surface.
///
/// The card's color and corner radius come from the application's card theme.
/// An optional [onTap] makes the whole card interactive.
class AppCard extends StatelessWidget {
  const AppCard({
    required this.child,
    this.onTap,
    this.padding = const EdgeInsets.all(AppSpacing.md),
    this.elevation = AppElevation.low,
    super.key,
  });

  final Widget child;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    final Widget content = Padding(padding: padding, child: child);

    return Card(
      elevation: elevation,
      clipBehavior: onTap != null ? Clip.antiAlias : Clip.none,
      child: onTap != null ? InkWell(onTap: onTap, child: content) : content,
    );
  }
}
