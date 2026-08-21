import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../presentation/views/login/login_screen.dart';
import '../presentation/views/login/register_screen.dart';
import '../presentation/views/home/home_screen.dart';
import '../presentation/views/trip_detail/trip_detail_screen.dart';
import '../presentation/views/settings/settings_screen.dart';
import '../presentation/views/account/account_screen.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final shellNavigatorKey = GlobalKey<NavigatorState>();

// 全局登录状态（用于路由判断）
bool isAuthenticated = false;
void setAuthenticated(bool value) => isAuthenticated = value;

// 用于触发路由刷新的可监听对象
class AuthRefreshNotifier extends ChangeNotifier {
  void notify() => notifyListeners();
}

final authRefreshNotifier = AuthRefreshNotifier();

final router = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: '/login',
  refreshListenable: authRefreshNotifier,
  redirect: (context, state) {
    final isLoggingIn = state.matchedLocation == '/login' || state.matchedLocation == '/register';
    if (isAuthenticated) {
      if (isLoggingIn) return '/';
    } else {
      if (!isLoggingIn) return '/login';
    }
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
        GoRoute(
          path: '/account',
          name: 'account',
          builder: (context, state) => const AccountScreen(),
        ),
      ],
    ),
  ],
);
