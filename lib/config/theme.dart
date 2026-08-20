import 'package:flutter/material.dart';

// ============ iOS 系统色 Token ============
// Light
const Color colorBgLight = Color(0xFFF2F2F7); // iOS systemGroupedBackground
const Color colorSurfaceLight = Color(0xFFFFFFFF);
const Color colorSurface2Light = Color(0xFFF4F2EC);
const Color colorInkLight = Color(0xFF1C1C1E); // iOS label
const Color colorInkSoftLight = Color(0xFF6E6E73); // iOS secondaryLabel
const Color colorInkFaintLight = Color(0xFFAEAEB2); // iOS tertiaryLabel
const Color colorBorderLight = Color(0xFFE5E5EA); // iOS separator
const Color colorAccentLight = Color(0xFF007AFF); // iOS system blue
const Color colorOrangeLight = Color(0xFFFF9500);
const Color colorGreenLight = Color(0xFF34C759);
const Color colorRedLight = Color(0xFFFF3B30);
const Color colorIndigoLight = Color(0xFF5E5CE6);

// Dark
const Color colorBgDark = Color(0xFF000000); // iOS 深色纯黑背景
const Color colorSurfaceDark = Color(0xFF1C1C1E);
const Color colorSurface2Dark = Color(0xFF2C2C2E);
const Color colorInkDark = Color(0xFFFFFFFF);
const Color colorInkSoftDark = Color(0xFF98989F);
const Color colorInkFaintDark = Color(0xFF636366);
const Color colorBorderDark = Color(0xFF38383A);
const Color colorAccentDark = Color(0xFF0A84FF);
const Color colorOrangeDark = Color(0xFFFF9F0A);
const Color colorGreenDark = Color(0xFF32D74B);
const Color colorRedDark = Color(0xFFFF453A);
const Color colorIndigoDark = Color(0xFF7D7AFF);

// ============ Light Theme ============
final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,

  colorScheme: const ColorScheme.light(
    primary: colorAccentLight,
    secondary: colorOrangeLight,
    tertiary: colorIndigoLight,
    error: colorRedLight,
    surface: colorSurfaceLight,
    surfaceVariant: colorSurface2Light,
    background: colorBgLight,
    onPrimary: Colors.white,
    onSurface: colorInkLight,
    onBackground: colorInkLight,
    onSurfaceVariant: colorInkSoftLight,
  ),

  scaffoldBackgroundColor: colorBgLight,
  dividerColor: colorBorderLight,

  appBarTheme: const AppBarTheme(
    backgroundColor: colorBgLight,
    foregroundColor: colorInkLight,
    elevation: 0,
    scrolledUnderElevation: 0,
    centerTitle: false,
    titleTextStyle: TextStyle(color: colorInkLight, fontSize: 17, fontWeight: FontWeight.w600),
  ),

  textTheme: const TextTheme(
    displayLarge: TextStyle(color: colorInkLight, fontSize: 32, fontWeight: FontWeight.w800),
    displayMedium: TextStyle(color: colorInkLight, fontSize: 28, fontWeight: FontWeight.w800),
    headlineSmall: TextStyle(color: colorInkLight, fontSize: 20, fontWeight: FontWeight.w700),
    titleLarge: TextStyle(color: colorInkLight, fontSize: 16, fontWeight: FontWeight.w600),
    bodyLarge: TextStyle(color: colorInkLight, fontSize: 16, fontWeight: FontWeight.w400),
    bodyMedium: TextStyle(color: colorInkSoftLight, fontSize: 13.5, fontWeight: FontWeight.w400),
    bodySmall: TextStyle(color: colorInkFaintLight, fontSize: 11.5, fontWeight: FontWeight.w400),
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: colorAccentLight,
      foregroundColor: Colors.white,
      elevation: 0,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
    ),
  ),

  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: colorAccentLight,
      side: const BorderSide(color: colorBorderLight, width: 1),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
    ),
  ),

  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: colorAccentLight,
      textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
    ),
  ),

  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: colorSurfaceLight,
    contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: colorBorderLight, width: 1),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: colorBorderLight, width: 1),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: colorAccentLight, width: 1.5),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: colorRedLight, width: 1),
    ),
    hintStyle: const TextStyle(color: colorInkFaintLight, fontSize: 14),
  ),

  cardTheme: CardThemeData(
    color: colorSurfaceLight,
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
      side: const BorderSide(color: colorBorderLight, width: 1),
    ),
    margin: EdgeInsets.zero,
  ),

  dialogTheme: DialogThemeData(
    backgroundColor: colorSurfaceLight,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
    elevation: 4,
  ),

  // 圆形勾选框，iOS Reminders 那种感觉
  checkboxTheme: CheckboxThemeData(
    shape: const CircleBorder(),
    side: const BorderSide(color: colorInkFaintLight, width: 1.6),
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) return colorAccentLight;
      return Colors.transparent;
    }),
  ),

  switchTheme: SwitchThemeData(
    trackColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) return colorGreenLight;
      return colorBorderLight;
    }),
  ),

  chipTheme: ChipThemeData(
    backgroundColor: colorSurface2Light,
    selectedColor: colorAccentLight,
    labelStyle: const TextStyle(fontSize: 12.5, color: colorInkLight),
    secondaryLabelStyle: const TextStyle(fontSize: 12.5, color: Colors.white),
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    side: BorderSide.none,
  ),

  navigationBarTheme: NavigationBarThemeData(
    backgroundColor: colorSurfaceLight,
    indicatorColor: colorAccentLight.withOpacity(.12),
    labelTextStyle: WidgetStateProperty.resolveWith((states) {
      final selected = states.contains(WidgetState.selected);
      return TextStyle(
        fontSize: 10.5,
        fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
        color: selected ? colorAccentLight : colorInkFaintLight,
      );
    }),
    iconTheme: WidgetStateProperty.resolveWith((states) {
      final selected = states.contains(WidgetState.selected);
      return IconThemeData(color: selected ? colorAccentLight : colorInkFaintLight, size: 24);
    }),
    elevation: 0,
    height: 62,
  ),

  dividerTheme: const DividerThemeData(color: colorBorderLight, thickness: 1, space: 1),
);

// ============ Dark Theme ============
final ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,

  colorScheme: const ColorScheme.dark(
    primary: colorAccentDark,
    secondary: colorOrangeDark,
    tertiary: colorIndigoDark,
    error: colorRedDark,
    surface: colorSurfaceDark,
    surfaceVariant: colorSurface2Dark,
    background: colorBgDark,
    onPrimary: Colors.white,
    onSurface: colorInkDark,
    onBackground: colorInkDark,
    onSurfaceVariant: colorInkSoftDark,
  ),

  scaffoldBackgroundColor: colorBgDark,
  dividerColor: colorBorderDark,

  appBarTheme: const AppBarTheme(
    backgroundColor: colorBgDark,
    foregroundColor: colorInkDark,
    elevation: 0,
    scrolledUnderElevation: 0,
    centerTitle: false,
    titleTextStyle: TextStyle(color: colorInkDark, fontSize: 17, fontWeight: FontWeight.w600),
  ),

  textTheme: const TextTheme(
    displayLarge: TextStyle(color: colorInkDark, fontSize: 32, fontWeight: FontWeight.w800),
    displayMedium: TextStyle(color: colorInkDark, fontSize: 28, fontWeight: FontWeight.w800),
    headlineSmall: TextStyle(color: colorInkDark, fontSize: 20, fontWeight: FontWeight.w700),
    titleLarge: TextStyle(color: colorInkDark, fontSize: 16, fontWeight: FontWeight.w600),
    bodyLarge: TextStyle(color: colorInkDark, fontSize: 16, fontWeight: FontWeight.w400),
    bodyMedium: TextStyle(color: colorInkSoftDark, fontSize: 13.5, fontWeight: FontWeight.w400),
    bodySmall: TextStyle(color: colorInkFaintDark, fontSize: 11.5, fontWeight: FontWeight.w400),
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: colorAccentDark,
      foregroundColor: Colors.white,
      elevation: 0,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
    ),
  ),

  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: colorAccentDark,
      side: const BorderSide(color: colorBorderDark, width: 1),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
    ),
  ),

  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: colorAccentDark,
      textStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
    ),
  ),

  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: colorSurfaceDark,
    contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: colorBorderDark, width: 1),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: colorBorderDark, width: 1),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: colorAccentDark, width: 1.5),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: colorRedDark, width: 1),
    ),
    hintStyle: const TextStyle(color: colorInkFaintDark, fontSize: 14),
  ),

  cardTheme: CardThemeData(
    color: colorSurfaceDark,
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
      side: const BorderSide(color: colorBorderDark, width: 1),
    ),
    margin: EdgeInsets.zero,
  ),

  dialogTheme: DialogThemeData(
    backgroundColor: colorSurfaceDark,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
    elevation: 4,
  ),

  checkboxTheme: CheckboxThemeData(
    shape: const CircleBorder(),
    side: const BorderSide(color: colorInkFaintDark, width: 1.6),
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) return colorAccentDark;
      return Colors.transparent;
    }),
  ),

  switchTheme: SwitchThemeData(
    trackColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) return colorGreenDark;
      return colorBorderDark;
    }),
  ),

  chipTheme: ChipThemeData(
    backgroundColor: colorSurface2Dark,
    selectedColor: colorAccentDark,
    labelStyle: const TextStyle(fontSize: 12.5, color: colorInkDark),
    secondaryLabelStyle: const TextStyle(fontSize: 12.5, color: Colors.white),
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    side: BorderSide.none,
  ),

  navigationBarTheme: NavigationBarThemeData(
    backgroundColor: colorSurfaceDark,
    indicatorColor: colorAccentDark.withOpacity(.16),
    labelTextStyle: WidgetStateProperty.resolveWith((states) {
      final selected = states.contains(WidgetState.selected);
      return TextStyle(
        fontSize: 10.5,
        fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
        color: selected ? colorAccentDark : colorInkFaintDark,
      );
    }),
    iconTheme: WidgetStateProperty.resolveWith((states) {
      final selected = states.contains(WidgetState.selected);
      return IconThemeData(color: selected ? colorAccentDark : colorInkFaintDark, size: 24);
    }),
    elevation: 0,
    height: 62,
  ),

  dividerTheme: const DividerThemeData(color: colorBorderDark, thickness: 1, space: 1),
);
