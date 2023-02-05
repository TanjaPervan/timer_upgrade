import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
          path: '/timer',
          name: TimerPage.pageName,
          pageBuilder: (context, state) => _buildMaterialPage(
            child: const TimerPage(),
          ),
        ),
      ],
    );
  }
}

Page<void> _buildMaterialPage({required Widget child}) {
  return MaterialPage<void>(child: child);
}
