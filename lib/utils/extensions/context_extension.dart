import 'dart:math';

import 'package:flutter/material.dart';

/// Media Query related extensions
extension MediaContextExtension on BuildContext {
  /// Returns the width of the current screen
  double get width => MediaQuery.sizeOf(this).width;

  /// Returns the height of the current screen
  double get height => MediaQuery.sizeOf(this).height;

  /// Returns the Size associated with the current BuildContext
  Size get screenSize => MediaQuery.sizeOf(this);

  /// Returns the EdgeInsets associated with the current BuildContext
  EdgeInsets get viewInsets => MediaQuery.viewInsetsOf(this);

  /// Returns the Brightness associated with the current BuildContext
  Brightness get platformBrightness => MediaQuery.platformBrightnessOf(this);
}

/// Sizing related extensions
extension SizeContextExtension on BuildContext {
  /// Calculates a width percentage
  double widthPercent(double val) => width * val;

  /// Calculates a height percentage
  double heightPercent(double val) => height * val;

  /// Returns padding based on keyboard visibility
  double get keyboardHeight => MediaQuery.viewInsetsOf(this).bottom;

  /// Returns whether keyboard is visible
  bool get isKeyboardVisible => MediaQuery.viewInsetsOf(this).bottom > 0;
}

/// Theme related extensions
extension ThemeContextExtension on BuildContext {
  /// Returns the current ThemeData
  ThemeData get theme => Theme.of(this);

  /// Returns the current TextTheme
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// Returns the current ColorScheme
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  /// Returns a random MaterialColor
  MaterialColor get randomPrimaryColor =>
      Colors.primaries[Random().nextInt(17)];
}

/// Navigation related extensions can be placed in a separate file
/// to avoid conflicts with go_router extensions
