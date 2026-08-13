import 'package:flutter/material.dart';

// ============ Colors ============
const Color colorWhite = Color(0xFFFFFFFF);
const Color colorBlack = Color(0xFF000000);

// Light Mode
const Color colorInk = Color(0xFF1B2A38);
const Color colorInkSoft = Color(0xFF5A6672);
const Color colorInkFaint = Color(0xFF98A1AA);
const Color colorBg = Color(0xFFFAFAFA);
const Color colorSurface = Color(0xFFFFFFFF);

// Semantic Colors
const Color colorRoute = Color(0xFF1F7A72); // Teal
const Color colorRouteSoft = Color(0xFFE0F2F1);
const Color colorEmber = Color(0xFFC1502E); // Red/Orange
const Color colorEmberSoft = Color(0xFFFFEBEE);
const Color colorGold = Color(0xFFB9852A); // Amber
const Color colorGoldSoft = Color(0xFFFFF8E1);
const Color colorAccent = Color(0xFF1F7A72);

// Dark Mode
const Color colorDarkBg = Color(0xFF11161D);
const Color colorDarkSurface = Color(0xFF1A2029);
const Color colorDarkInk = Color(0xFFEFE9DA);
const Color colorDarkInkSoft = Color(0xFFA7AFB8);

// ============ Light Theme ============
final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  
  colorScheme: ColorScheme.light(
    primary: colorAccent,
    secondary: colorEmber,
    tertiary: colorGold,
    error: colorEmber,
    surface: colorSurface,
    background: colorBg,
    onPrimary: colorWhite,
    onBackground: colorInk,
  ),
  
  scaffoldBackgroundColor: colorBg,
  
  // App Bar
  appBarTheme: const AppBarTheme(
    backgroundColor: colorSurface,
    foregroundColor: colorInk,
    elevation: 0,
    centerTitle: false,
    titleTextStyle: TextStyle(
      color: colorInk,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
  ),
  
  // Text Theme
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      color: colorInk,
      fontSize: 32,
      fontWeight: FontWeight.w900,
    ),
    displayMedium: TextStyle(
      color: colorInk,
      fontSize: 28,
      fontWeight: FontWeight.w700,
    ),
    headlineSmall: TextStyle(
      color: colorInk,
      fontSize: 20,
      fontWeight: FontWeight.w700,
    ),
    titleLarge: TextStyle(
      color: colorInk,
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
    bodyLarge: TextStyle(
      color: colorInk,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: TextStyle(
      color: colorInkSoft,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    bodySmall: TextStyle(
      color: colorInkFaint,
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ),
  ),
  
  // Button Theme
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: colorAccent,
      foregroundColor: colorWhite,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    ),
  ),
  
  // Input Decoration
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: colorSurface,
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Color(0xFFE0E0E0), width: 1),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Color(0xFFE0E0E0), width: 1),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: colorAccent, width: 1.5),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: colorEmber, width: 1),
    ),
  ),
  
  // Card Theme
  cardTheme: CardThemeData(
    color: colorSurface,
    elevation: 0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    margin: EdgeInsets.zero,
  ),

  // Dialog Theme
  dialogTheme: DialogThemeData(
    backgroundColor: colorSurface,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    elevation: 8,
  ),
);

// ============ Dark Theme ============
final ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  
  colorScheme: ColorScheme.dark(
    primary: Color(0xFF43B8AD),
    secondary: Color(0xFFE27B54),
    tertiary: Color(0xFFD9A94C),
    error: Color(0xFFE27B54),
    surface: colorDarkSurface,
    background: colorDarkBg,
    onPrimary: colorDarkBg,
    onBackground: colorDarkInk,
  ),
  
  scaffoldBackgroundColor: colorDarkBg,
  
  appBarTheme: AppBarTheme(
    backgroundColor: colorDarkSurface,
    foregroundColor: colorDarkInk,
    elevation: 0,
    centerTitle: false,
    titleTextStyle: TextStyle(
      color: colorDarkInk,
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
  ),
  
  textTheme: TextTheme(
    displayLarge: TextStyle(
      color: colorDarkInk,
      fontSize: 32,
      fontWeight: FontWeight.w900,
    ),
    displayMedium: TextStyle(
      color: colorDarkInk,
      fontSize: 28,
      fontWeight: FontWeight.w700,
    ),
    headlineSmall: TextStyle(
      color: colorDarkInk,
      fontSize: 20,
      fontWeight: FontWeight.w700,
    ),
    titleLarge: TextStyle(
      color: colorDarkInk,
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
    bodyLarge: TextStyle(
      color: colorDarkInk,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
    bodyMedium: TextStyle(
      color: colorDarkInkSoft,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    bodySmall: TextStyle(
      color: Color(0xFF6C7580),
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ),
  ),
  
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Color(0xFF43B8AD),
      foregroundColor: colorDarkBg,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    ),
  ),
  
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: colorDarkSurface,
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Color(0xFF2A3238), width: 1),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Color(0xFF2A3238), width: 1),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Color(0xFF43B8AD), width: 1.5),
    ),
  ),
  
  cardTheme: CardThemeData(
    color: colorDarkSurface,
    elevation: 0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    margin: EdgeInsets.zero,
  ),
);
