import 'package:flutter/foundation.dart';

/// Collections of constant durations.
///

@immutable
final class Durations {
  const Durations._();

  /// Too slow duration constant with 1800 milliseconds.
  static const Duration tooSlow = Duration(milliseconds: 1800);

  /// Slow duration constant with 1500 milliseconds.
  static const Duration slow = Duration(milliseconds: 1500);

  /// Slow-Medium duration constant with 1200 milliseconds.
  static const Duration slowMed = Duration(milliseconds: 1200);

  /// Medium duration constant with 1000 milliseconds.
  static const Duration med = Duration(milliseconds: 1000);

  /// Medium-Fast duration constant with 800 milliseconds.
  static const Duration medFast = Duration(milliseconds: 800);

  /// Fast duration constant with 250 milliseconds.
  static const Duration fast = Duration(milliseconds: 240);

  /// Too fast duration constant with 125 milliseconds.
  static const Duration tooFast = Duration(milliseconds: 120);
}
