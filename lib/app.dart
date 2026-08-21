import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'config/theme.dart';
import 'config/routes.dart';
import 'presentation/controllers/theme_controller.dart';
import 'presentation/providers.dart';

class LvjiApp extends ConsumerWidget {
  const LvjiApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeControllerProvider);
    // 监听登录状态变化，触发路由刷新
    final authState = ref.watch(authStateProvider);

    // 更新全局登录状态
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (authState.isLoggedIn != isAuthenticated) {
        setAuthenticated(authState.isLoggedIn);
        authRefreshNotifier.notify();
      }
    });

    return MaterialApp.router(
      title: '旅记',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeMode,
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        DefaultMaterialLocalizations.delegate,
        DefaultWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('zh', 'CN'),
        Locale('en', 'US'),
      ],
    );
  }
}
