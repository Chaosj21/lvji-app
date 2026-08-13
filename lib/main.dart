import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // TODO: Initialize other services (location, map, analytics, etc.)
  // TODO: Load app config
  // TODO: Setup crash reporting
  
  runApp(
    const ProviderScope(
      child: LvjiApp(),
    ),
  );
}
