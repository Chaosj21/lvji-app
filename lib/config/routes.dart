import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../presentation/views/login/login_screen.dart';
import '../presentation/views/login/register_screen.dart';
import '../presentation/views/home/home_screen.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final shellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: '/login',
  redirect: (context, state) async {
    // TODO(Phase 1+): 接入真实的持久化登录态判断（如 shared_preferences 中的 token）
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
      builder: (context, state, child) {
        return child;
      },
      routes: [
        GoRoute(
          path: '/',
          name: 'home',
          builder: (context, state) => const HomeScreen(),
          routes: [
            GoRoute(
              path: 'trip/:tripId',
              name: 'trip-detail',
              // TODO(Phase 2): 替换为真实的 TripDetailScreen（计划/随记/后记三个 Tab）
              builder: (context, state) => TripDetailScreenPlaceholder(
                tripId: state.pathParameters['tripId']!,
              ),
            ),
          ],
        ),
        GoRoute(
          path: '/settings',
          name: 'settings',
          // TODO(Phase 5): 替换为真实的 SettingsScreen
          builder: (context, state) => const SettingsScreenPlaceholder(),
        ),
      ],
    ),
  ],
);

/// Phase 2 中会被替换为真实的 Trip 详情页（含 计划/随记/后记 三个 Tab）
class TripDetailScreenPlaceholder extends StatelessWidget {
  final String tripId;

  const TripDetailScreenPlaceholder({
    required this.tripId,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(onPressed: () => Navigator.of(context).maybePop()),
        title: Text('旅程详情 · $tripId'),
      ),
      body: const Center(child: Text('计划 / 随记 / 后记 页面将在 Phase 2-4 中实现')),
    );
  }
}

/// Phase 5 中会被替换为真实的设置页
class SettingsScreenPlaceholder extends StatelessWidget {
  const SettingsScreenPlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('设置')),
      body: const Center(child: Text('设置页面将在 Phase 5 中实现')),
    );
  }
}
