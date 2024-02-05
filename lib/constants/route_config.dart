import 'package:bloc_cubit_base/UI/login/login_page.dart';
import 'package:bloc_cubit_base/UI/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  AppRouter._();

  static final navigationKey = GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    routes: _routes,
    debugLogDiagnostics: true,
    navigatorKey: navigationKey,
  );

  ///main page
  static const String splash = "/";
  static const String login = "login";

  // GoRouter configuration
  static final _routes = <RouteBase>[
    GoRoute(path: splash, builder: (context, state) => const SplashPage()),
    GoRoute(
      name: login,
      path: "/$login",
      builder: (context, state) => const LoginPage(),
    ),
  ];
}
