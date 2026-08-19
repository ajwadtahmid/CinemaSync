import 'package:flutter/material.dart';

import '../../core/theme/app_opacity.dart';
import '../../core/theme/app_spacing.dart';

/// The shared error surface. Every mapped failure renders through this rather
/// than through an ad-hoc message, so errors stay consistent and never get
/// swallowed silently.
///
/// A feature that is merely *offline* should not use this — offline is an
/// expected state in this app, not an error, and gets its own explicit
/// treatment.
class ErrorView extends StatelessWidget {
  const ErrorView({
    super.key,
    required this.message,
    this.onRetry,
    this.retryLabel = 'Try again',
  });

  final String message;
  final VoidCallback? onRetry;
  final String retryLabel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: cs.error.withValues(alpha: AppOpacity.faint),
              ),
              child: Icon(Icons.error_outline, color: cs.error, size: 28),
            ),
            const SizedBox(height: AppSpacing.lg),
            Text(
              message,
              style: theme.textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            if (onRetry != null) ...[
              const SizedBox(height: AppSpacing.xl),
              OutlinedButton.icon(
                onPressed: onRetry,
                icon: const Icon(Icons.refresh, size: 18),
                label: Text(retryLabel),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
