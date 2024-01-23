import 'package:flutter/material.dart';
import 'package:flutter_todo/models/todo.dart';
import 'package:flutter_todo/pages/create.dart';
import 'package:flutter_todo/pages/edit.dart';
import 'package:flutter_todo/pages/home.dart';
import 'package:go_router/go_router.dart';

abstract class ScreenPaths {
  static String home = '/';
  static String create = '/create';
  static String edit = '/edit';
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
    GoRoute(
      path: ScreenPaths.edit,
      builder: (BuildContext context, GoRouterState state) {
        return EditToDoPage(
          todo: state.extra as Todo,
        );
      },
    ),
  ],
);
