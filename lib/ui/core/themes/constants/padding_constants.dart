import 'package:flutter/material.dart';

class PaddingConstants {
  /// The smallest padding value (4.0)
  ///
  /// Used for minimal spacing between elements
  /// Example: Small icon padding, tight lists
  static const double xs = 4;

  /// Small padding value (8.0)
  ///
  /// Used for general small spacing needs
  /// Example: Between related items, compact lists
  static const double sm = 8;

  /// Medium padding value (16.0)
  ///
  /// Standard padding for most UI elements
  /// Example: Content padding, list items
  static const double md = 16;

  /// Large padding value (24.0)
  ///
  /// Used for significant spacing needs
  /// Example: Section separators, modal margins
  static const double lg = 24;

  /// Extra large padding value (32.0)
  ///
  /// Used for emphasizing separation between elements
  /// Example: Page sections, large gaps
  static const double xl = 32;

  /// Double extra large padding value (40.0)
  ///
  /// Maximum standard padding
  /// Example: Major section breaks, splash screens
  static const double xxl = 40;

  /// Standard screen edge padding
  ///
  /// Provides consistent margin around screen content
  /// Example: SafeArea padding, screen margins
  static const EdgeInsets screenEdge = EdgeInsets.all(md);

  /// Standard content padding
  ///
  /// Used for general content containers
  /// Example: Card content, list views
  static const EdgeInsets contentPadding = EdgeInsets.all(md);

  /// Modal dialog padding
  ///
  /// Consistent padding for modal dialogs and bottom sheets
  /// Example: Bottom sheets, alert dialogs
  static const EdgeInsets modalPadding = EdgeInsets.all(lg);

  /// Form input field padding
  ///
  /// Standard padding for text fields and form inputs
  /// Example: TextFormField, InputDecorator
  static const EdgeInsets inputFieldPadding = EdgeInsets.symmetric(
    horizontal: md,
    vertical: sm,
  );

  /// Vertical spacing between form fields
  ///
  /// Provides consistent spacing in forms
  /// Example: Spacing between TextFormFields
  static const EdgeInsets formFieldSpacing = EdgeInsets.only(bottom: md);

  /// List item padding
  ///
  /// Standard padding for list items
  /// Example: ListView items, ListTile
  static const EdgeInsets listItemPadding = EdgeInsets.symmetric(
    horizontal: md,
    vertical: sm,
  );

  /// Grid item padding
  ///
  /// Consistent padding for grid items
  /// Example: GridView items, image grids
  static const EdgeInsets gridItemPadding = EdgeInsets.all(sm);

  /// Card container padding
  ///
  /// Outer padding for card widgets
  /// Example: Card margins, elevated containers
  static const EdgeInsets cardPadding = EdgeInsets.all(md);

  /// Card content padding
  ///
  /// Inner padding for card content
  /// Example: Content inside Card widget
  static const EdgeInsets cardContentPadding = EdgeInsets.all(sm);

  /// Standard button padding
  ///
  /// Consistent padding for buttons
  /// Example: ElevatedButton, TextButton
  static const EdgeInsets buttonPadding = EdgeInsets.symmetric(
    horizontal: lg,
    vertical: sm,
  );

  /// Icon button padding
  ///
  /// Minimal padding for icon buttons
  /// Example: IconButton, small action buttons
  static const EdgeInsets iconButtonPadding = EdgeInsets.all(xs);

  /// Bottom navigation bar padding
  ///
  /// Standard padding for bottom navigation
  /// Example: BottomNavigationBar, BottomAppBar
  static const EdgeInsets bottomNavPadding = EdgeInsets.symmetric(
    horizontal: md,
    vertical: sm,
  );

  /// App bar padding
  ///
  /// Horizontal padding for app bar content
  /// Example: AppBar title and actions
  static const EdgeInsets appBarPadding = EdgeInsets.symmetric(
    horizontal: md,
  );

  /// Dialog padding
  ///
  /// Outer padding for dialogs
  /// Example: AlertDialog, SimpleDialog
  static const EdgeInsets dialogPadding = EdgeInsets.all(lg);

  /// Dialog content padding
  ///
  /// Inner padding for dialog content
  /// Example: Dialog body content
  static const EdgeInsets dialogContentPadding = EdgeInsets.symmetric(
    horizontal: md,
    vertical: lg,
  );

  /// Creates custom padding with specified values
  ///
  /// Parameters:
  /// - [all] applies to all sides if no other value is specified
  /// - [horizontal] applies to left and right if specified
  /// - [vertical] applies to top and bottom if specified
  /// - Individual sides: [left], [top], [right], [bottom]
  ///
  /// Example:
  /// ```dart
  /// PaddingConstants.custom(horizontal: 16, top: 8)
  /// ```
  static EdgeInsets custom({
    double all = 0,
    double horizontal = 0,
    double vertical = 0,
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) {
    return EdgeInsets.only(
      left: left > 0 ? left : (horizontal > 0 ? horizontal : all),
      top: top > 0 ? top : (vertical > 0 ? vertical : all),
      right: right > 0 ? right : (horizontal > 0 ? horizontal : all),
      bottom: bottom > 0 ? bottom : (vertical > 0 ? vertical : all),
    );
  }
}
