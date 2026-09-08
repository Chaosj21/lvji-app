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

/// 排查"No MaterialLocalizations found"问题：Flutter 自带的页面切换动画
/// （不管选 Material 默认 / Zoom / Cupertino 哪一种）都会在路由外面包一层
/// 返回手势检测组件，这层包装目前在咱们的场景里会导致 Localizations 传递断裂。
/// 用 go_router 的 NoTransitionPage 让所有路由跳过这整套包装机制，直接验证问题是否消失。
Page<void> _noTransitionPage(Widget child, GoRouterState state) {
  return NoTransitionPage<void>(key: state.pageKey, child: child);
}

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
      pageBuilder: (context, state) => _noTransitionPage(const LoginScreen(), state),
    ),
    GoRoute(
      path: '/register',
      name: 'register',
      pageBuilder: (context, state) => _noTransitionPage(const RegisterScreen(), state),
    ),
    ShellRoute(
      navigatorKey: shellNavigatorKey,
      builder: (context, state, child) => child,
      routes: [
        GoRoute(
          path: '/',
          name: 'home',
          pageBuilder: (context, state) => _noTransitionPage(const HomeScreen(), state),
          routes: [
            GoRoute(
              path: 'trip/:tripId',
              name: 'trip-detail',
              pageBuilder: (context, state) => _noTransitionPage(
                TripDetailScreen(tripId: state.pathParameters['tripId']!),
                state,
              ),
            ),
          ],
        ),
        GoRoute(
          path: '/settings',
          name: 'settings',
          pageBuilder: (context, state) => _noTransitionPage(const SettingsScreen(), state),
        ),
        GoRoute(
          path: '/account',
          name: 'account',
          pageBuilder: (context, state) => _noTransitionPage(const AccountScreen(), state),
        ),
      ],
    ),
  ],
);
