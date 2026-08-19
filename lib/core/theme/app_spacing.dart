/// Design tokens: spacing, radii, and durations used across the app.
///
/// Use these instead of hard-coded numbers so the UI stays consistent.
class AppSpacing {
  const AppSpacing._();

  // 4-pt spacing scale.
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double xl = 24;
  static const double xxl = 32;
  static const double xxxl = 48;
}

/// Layout constraints.
class AppLayout {
  const AppLayout._();

  /// Max width for primary content on large/desktop windows, so text lines and
  /// controls don't stretch edge-to-edge.
  static const double maxContentWidth = 1040;

  /// A tighter measure for reading-oriented detail content.
  static const double readableContentWidth = 920;
}

/// Corner radii.
class AppRadius {
  const AppRadius._();

  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double xl = 24;
  static const double pill = 999;
}

/// Fixed component sizes (heights, widths, tap targets).
class AppSizes {
  const AppSizes._();

  /// Primary action button height (FilledButton / OutlinedButton full-width).
  static const double buttonHeightLg = 54;

  /// Secondary action button height.
  static const double buttonHeightMd = 52;

  /// Square icon-button hit area (Watch Later, Add to list, Delete, etc.).
  static const double iconButton = 54;

  /// Bottom navigation bar height.
  static const double navBarHeight = 68;
}

/// Animation durations.
class AppDurations {
  const AppDurations._();

  /// Very quick snap — press/release feedback, micro-interactions (60 ms).
  static const Duration instant = Duration(milliseconds: 60);

  /// Fast tab/color transitions (150 ms).
  static const Duration fast = Duration(milliseconds: 150);

  /// Slightly longer than fast — filter bar selection (180 ms).
  static const Duration swift = Duration(milliseconds: 180);

  /// General UI transitions (250 ms).
  static const Duration normal = Duration(milliseconds: 250);

  /// Smooth content reveals — rating bar fill (300 ms).
  static const Duration medium = Duration(milliseconds: 300);

  /// Heavier transitions (400 ms).
  static const Duration slow = Duration(milliseconds: 400);

  /// Full shimmer sweep cycle (1 300 ms).
  static const Duration shimmerCycle = Duration(milliseconds: 1300);

  /// Search/person debounce — waits this long after last keystroke before firing.
  static const Duration debounce = Duration(milliseconds: 350);
}
