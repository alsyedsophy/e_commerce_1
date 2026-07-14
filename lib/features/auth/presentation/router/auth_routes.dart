import 'package:e_commerce_1/core/routing/routing.dart';
import 'package:e_commerce_1/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:e_commerce_1/features/auth/presentation/cubit/auth_state.dart';
import 'package:e_commerce_1/features/auth/presentation/screens/login_screen.dart';
import 'package:e_commerce_1/features/auth/presentation/screens/register_screen.dart';
import 'package:e_commerce_1/features/auth/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

List<RouteBase> get authRoutes => [
  GoRoute(
    path: RoutePaths.splash,
    name: RoutePaths.splashName,
    builder: (BuildContext context, GoRouterState state) =>
        const SplashScreen(),
  ),
  GoRoute(
    path: RoutePaths.login,
    name: RoutePaths.loginName,
    builder: (BuildContext context, GoRouterState state) => const LoginScreen(),
  ),
  GoRoute(
    path: RoutePaths.register,
    name: RoutePaths.registerName,
    builder: (BuildContext context, GoRouterState state) =>
        const RegisterScreen(),
  ),
];

String? authRedirect(BuildContext context, GoRouterState state) {
  final AuthStatus status = context.read<AuthCubit>().state.status;
  final String location = state.matchedLocation;
  final bool onSplash = location == RoutePaths.splash;
  final bool onAuthRoute =
      location == RoutePaths.login || location == RoutePaths.register;

  if (status == AuthStatus.initial) {
    return onSplash ? null : RoutePaths.splash;
  }

  if (status == AuthStatus.authenticated) {
    return onAuthRoute || onSplash ? RoutePaths.home : null;
  }

  // Signed out: protect everything except the auth screens.
  return onAuthRoute ? null : RoutePaths.login;
}
