import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tanja_timer/pages/completed_page.dart';
import 'package:tanja_timer/pages/home_page.dart';
import 'package:tanja_timer/pages/timer_page.dart';

class RouterService {
  late final GoRouter _goRouter;
  GoRouter get router => _goRouter;

  RouterService() {
    _buildRouter();
  }

  void _buildRouter() {
    _goRouter = GoRouter(
      routes: <RouteBase>[
        GoRoute(
          path: '/',
          name: HomePage.pageName,
          pageBuilder: (context, state) => _buildMaterialPage(
            child: const HomePage(),
          ),
        ),
        GoRoute(
          path: '/${TimerPage.pageName}/:minutes',
          name: TimerPage.pageName,
          pageBuilder: (context, state) => _buildMaterialPage(
            child: TimerPage(minutes: state.params['minutes']!),
          ),
        ),
        GoRoute(
          path: '/${CompletedPage.pageName}/:completed',
          name: CompletedPage.pageName,
          pageBuilder: (context, state) => _buildMaterialPage(
            child: CompletedPage(minutes: state.params['completed']!),
          ),
        ),
      ],
    );
  }
}

Page<void> _buildMaterialPage({required Widget child}) {
  return MaterialPage<void>(child: child);
}
