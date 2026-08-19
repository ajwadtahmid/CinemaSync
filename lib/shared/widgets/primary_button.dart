import 'package:flutter/material.dart';

import '../../core/theme/app_spacing.dart';

/// The app's primary call-to-action button.
///
/// Keeps a stable height while loading so the surrounding layout does not jump,
/// and stays labelled for screen readers even when showing a spinner.
class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.isLoading = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Semantics(
      button: true,
      label: label,
      enabled: onPressed != null && !isLoading,
      child: ExcludeSemantics(
        child: FilledButton(
          onPressed: isLoading ? null : onPressed,
          child: isLoading
              ? SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.5,
                    color: cs.onPrimary,
                  ),
                )
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (icon != null) ...[
                      Icon(icon, size: 18),
                      const SizedBox(width: AppSpacing.sm),
                    ],
                    Text(label),
                  ],
                ),
        ),
      ),
    );
  }
}
