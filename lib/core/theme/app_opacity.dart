/// Named opacity values used with `Color.withValues(alpha: …)` across the app.
///
/// Centralising these prevents copy-paste drift and makes intent legible at the
/// call site.
class AppOpacity {
  const AppOpacity._();

  // ---- fills ----
  static const double hairline = 0.08; // barely-there gradient end / dim tint
  static const double faint = 0.12; // icon container, pressed-state bg
  static const double tint = 0.14; // selection pill, nav-tab highlight
  static const double softFill = 0.18; // icon container fill
  static const double fill = 0.22; // banner / card gradient start
  static const double surface = 0.28; // tile surface (hero tile gradient)

  // ---- borders ----
  static const double borderFaint = 0.35; // tile card borders
  static const double border = 0.40; // banner borders, strong chip border
  static const double borderStrong = 0.50; // swipe chip border

  // ---- overlays ----
  static const double overlay = 0.55; // dark overlay (badge background)
  static const double scrim = 0.62; // image scrim (media-type badge bg)
  static const double stamp = 0.90; // stamp label max opacity
}
