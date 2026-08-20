// Compatibility utility: hashValues was removed from dart:ui in Flutter 3.44
// This file provides it as a drop-in replacement for third-party plugins.
int hashValues(Object? a, Object? b) => Object.hash(a, b);
int hashValues3(Object? a, Object? b, Object? c) => Object.hash(a, b, c);
int hashValues4(Object? a, Object? b, Object? c, Object? d) => Object.hash(a, b, c, d);
