import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';

/// TMDB attribution, required wherever TMDB data or images render.
///
/// This is a term of using their API, not a courtesy — so it is a shared widget
/// rather than a string copied per screen, and it must not be conditionally
/// hidden to tidy up a layout.
class TmdbAttribution extends StatelessWidget {
  const TmdbAttribution({super.key, this.compact = false});

  /// Drops the explanatory sentence, keeping just the wordmark. For dense
  /// surfaces such as a card footer.
  final bool compact;

  static const String _statement =
      'This product uses the TMDB API but is not endorsed or certified by TMDB.';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Semantics(
      label: compact ? 'Data provided by TMDB' : _statement,
      child: ExcludeSemantics(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.md,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'TMDB',
                style: theme.textTheme.labelLarge?.copyWith(
                  color: AppColors.tmdbCyan,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.5,
                ),
              ),
              if (!compact) ...[
                const SizedBox(height: AppSpacing.xs),
                Text(
                  _statement,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
