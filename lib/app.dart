import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
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
      // 修复：DefaultMaterialLocalizations/DefaultWidgetsLocalizations 只支持英文，
      // 中文设备下会导致 Localizations 加载失败（"No MaterialLocalizations found" 的真正原因）。
      // 换成 flutter_localizations 包里真正支持多语言的 Global* 委托。
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate, // Cupertino 转场/图标等也需要这个
      ],
      supportedLocales: const [
        Locale('zh', 'CN'),
        Locale('en', 'US'),
      ],
    );
  }
}
