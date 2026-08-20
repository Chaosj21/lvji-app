import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../presentation/views/login/login_screen.dart';
import '../presentation/views/login/register_screen.dart';
import '../presentation/views/home/home_screen.dart';
import '../presentation/views/trip_detail/trip_detail_screen.dart';
import '../presentation/views/settings/settings_screen.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final shellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: '/login',
  redirect: (context, state) async {
    // TODO(Phase 1+): 接入真实的持久化登录态判断
    return null;
  },
  routes: [
    GoRoute(
      path: '/login',
      name: 'login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/register',
      name: 'register',
      builder: (context, state) => const RegisterScreen(),
    ),
    ShellRoute(
      navigatorKey: shellNavigatorKey,
      builder: (context, state, child) => child,
      routes: [
        GoRoute(
          path: '/',
          name: 'home',
          builder: (context, state) => const HomeScreen(),
          routes: [
            GoRoute(
              path: 'trip/:tripId',
              name: 'trip-detail',
              builder: (context, state) => TripDetailScreen(
                tripId: state.pathParameters['tripId']!,
              ),
            ),
          ],
        ),
        GoRoute(
          path: '/settings',
          name: 'settings',
          builder: (context, state) => const SettingsScreen(),
        ),
      ],
    ),
  ],
);
