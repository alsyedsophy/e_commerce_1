import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'route_error_screen.dart';
import 'route_paths.dart';

class AppRouter {
  AppRouter._();

  static GoRouter create({required Widget home}) {
    return GoRouter(
      initialLocation: RoutePaths.home,
      routes: <RouteBase>[
        GoRoute(
          path: RoutePaths.home,
          name: RoutePaths.homeName,
          builder: (BuildContext context, GoRouterState state) => home,
        ),
      ],
      errorBuilder: (BuildContext context, GoRouterState state) =>
          RouteErrorScreen(message: state.error?.message),
    );
  }
}
