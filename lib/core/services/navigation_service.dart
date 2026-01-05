import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

/// Centralized navigation using go_router.

/// - Works cleanly with BLoC and Clean Architecture
/// - Avoids manually managing NavigatorKeys

/// USED IN:
/// - Login flow
/// - POS main screen navigation
class NavigationService {
  /// Singleton router instance
  static final GoRouter router = GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) => const Placeholder(), // Replace with LoginScreen
      ),
      GoRoute(
        path: '/main',
        builder: (context, state) => const Placeholder(), // Replace with MainScreen
      ),
    ],
  );

  /// Navigate to a route by path
  static void navigateTo(String path) {
    router.go(path);
  }

  /// Pop current route
  static void goBack() {
    router.pop();
  }
}
