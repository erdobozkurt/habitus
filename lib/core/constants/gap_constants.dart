import 'package:flutter/material.dart';

/// Contains constant values for spacing/gaps used throughout the app
class GapConstants {
  // Private constructor to prevent instantiation
  const GapConstants._();

  // Height Gaps
  static const h4 = SizedBox(height: 4);
  static const h8 = SizedBox(height: 8);
  static const h12 = SizedBox(height: 12);
  static const h16 = SizedBox(height: 16);
  static const h20 = SizedBox(height: 20);
  static const h24 = SizedBox(height: 24);
  static const h32 = SizedBox(height: 32);
  static const h48 = SizedBox(height: 48);
  static const h64 = SizedBox(height: 64);

  // Width Gaps
  static const w4 = SizedBox(width: 4);
  static const w8 = SizedBox(width: 8);
  static const w12 = SizedBox(width: 12);
  static const w16 = SizedBox(width: 16);
  static const w20 = SizedBox(width: 20);
  static const w24 = SizedBox(width: 24);
  static const w32 = SizedBox(width: 32);
  static const w48 = SizedBox(width: 48);
  static const w64 = SizedBox(width: 64);

  // Named gaps for semantic usage

  /// 4px
  static const gapTiny = SizedBox(height: 4, width: 4);

  /// 8px
  static const gapSmall = SizedBox(height: 8, width: 8);

  /// 16px
  static const gapMedium = SizedBox(height: 16, width: 16);

  /// 24px
  static const gapLarge = SizedBox(height: 24, width: 24);

  /// 32px
  static const gapXLarge = SizedBox(height: 32, width: 32);

  // Device specific gaps
  static SizedBox deviceSpecificGap(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    if (screenHeight < 600) return h16;
    if (screenHeight < 800) return h24;
    return h32;
  }
}

// Extension for easier usage
extension GapExtension on num {
  SizedBox get height => SizedBox(height: toDouble());
  SizedBox get width => SizedBox(width: toDouble());
  SizedBox get square => SizedBox(height: toDouble(), width: toDouble());
}

// Usage examples:
// GapConstants.h16
// GapConstants.gapMedium
// 16.height
// 8.width
// 24.square
