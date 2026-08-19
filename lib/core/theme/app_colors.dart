import 'package:flutter/material.dart';

import '../../shared/models/media_type.dart';

/// Brand color tokens for CinemaSync.
///
/// Direction: Apple TV-first, quiet and premium. Light (not heavy) monochrome —
/// cool-tinted near-black surfaces with a subtle slate/blue undertone — and a
/// single cool accent (a refined periwinkle-indigo) used sparingly for
/// interactive/active states. The artwork carries the color; the chrome stays
/// calm.
class AppColors {
  const AppColors._();

  /// Primary accent — a slightly desaturated periwinkle-indigo. Cooler and more
  /// premium than a stock blue, and distinct from the teal secondary.
  static const Color primarySeed = Color(0xFF7C83F2);

  /// Secondary accent — cool teal, for "match" / positive states.
  static const Color secondarySeed = Color(0xFF2DD4BF);

  // ---- Swipe-deck signal colors (three-direction deck) ----
  /// Right — interested.
  static const Color swipeRight = Color(0xFF34D399);

  /// Left — skip.
  static const Color swipeLeft = Color(0xFFF87171);

  /// Up — permanent dismiss ("never show me this again").
  static const Color swipeDismiss = Color(0xFF8A93A6);

  /// 0.5–10 rating star color (kept warm so ratings read as a distinct signal).
  static const Color rating = Color(0xFFF5C451);

  // ---- Dark surface ramp (default theme) — cool-tinted near-blacks ----
  /// App canvas — deepest layer.
  static const Color darkBackground = Color(0xFF0A0C12);

  /// Cards / sheets sitting on the canvas.
  static const Color darkSurface = Color(0xFF13161F);

  /// Elevated controls (inputs, selected chips, raised cards).
  static const Color darkSurfaceHigh = Color(0xFF1C2030);

  /// Hairline borders / dividers on dark surfaces.
  static const Color darkBorder = Color(0xFF272C3A);

  /// Muted foreground (captions, secondary text, inactive icons).
  static const Color darkMuted = Color(0xFF98A0B3);

  /// TMDB brand cyan, used only for the "view on TMDB" attribution link.
  static const Color tmdbCyan = Color(0xFF01B4E4);

  /// 8-swatch avatar accent palette (user-selectable in profile settings).
  /// Index 0 is the default (periwinkle-indigo = primarySeed).
  static const List<Color> avatarSwatches = [
    Color(0xFF7C83F2), // periwinkle-indigo (= primarySeed)
    Color(0xFF2DD4BF), // teal (= secondarySeed)
    Color(0xFFF87171), // rose
    Color(0xFFFBBF24), // amber
    Color(0xFF34D399), // emerald (= swipeRight)
    Color(0xFF818CF8), // violet
    Color(0xFFF472B6), // pink
    Color(0xFF38BDF8), // sky
  ];

  /// 5-swatch chart palette used in the genre-breakdown bar (stats card).
  static const List<Color> chartSwatches = [
    Color(0xFF6C63FF),
    Color(0xFF26C6DA),
    Color(0xFFFF7043),
    Color(0xFF66BB6A),
    Color(0xFFFFCA28),
  ];

  /// The accent that represents a given media type across the app: movies use
  /// the periwinkle-indigo primary, TV uses the teal secondary. Spreading this
  /// pairing (badges, pills, tiles) keeps both accents feeling intentional
  /// rather than incidental.
  static Color forMedia(MediaType type) =>
      type == MediaType.movie ? primarySeed : secondarySeed;
}
