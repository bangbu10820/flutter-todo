import 'package:flutter/material.dart';
import 'package:flutter_todo/pages/create.dart';
import 'package:flutter_todo/pages/home.dart';
import 'package:go_router/go_router.dart';

abstract class ScreenPaths {
  static String home = '/';
  static String create = '/create';
}

/// The route configuration.
final GoRouter router = GoRouter(
  initialLocation: ScreenPaths.home,
  routes: <RouteBase>[
    GoRoute(
      path: ScreenPaths.home,
      builder: (BuildContext context, GoRouterState state) {
        return const MyHomePage();
      },
    ),
    GoRoute(
      path: ScreenPaths.create,
      builder: (BuildContext context, GoRouterState state) {
        return const CreateToDoPage();
      },
    ),
  ],
);
