import 'package:flutter/material.dart';

import '../../../core/error/failure.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../shared/models/title_summary.dart';
import '../../../shared/widgets/app_loader.dart';
import '../../../shared/widgets/poster_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A horizontally scrolling row of posters with a section heading.
///
/// Loading and failure are handled inline rather than taking over the screen:
/// one rail failing should not blank out the rails that loaded fine.
class PosterRail extends StatelessWidget {
  const PosterRail({
    super.key,
    required this.heading,
    required this.titles,
    required this.onTitleTap,
  });

  final String heading;
  final AsyncValue<List<TitleSummary>> titles;
  final void Function(TitleSummary) onTitleTap;

  static const double _railHeight = 260;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.lg,
            AppSpacing.xl,
            AppSpacing.lg,
            AppSpacing.md,
          ),
          child: Text(heading, style: theme.textTheme.titleMedium),
        ),
        SizedBox(
          height: _railHeight,
          child: titles.when(
            loading: () => const AppLoader(),
            error: (error, _) => _RailMessage(
              message: error is Failure
                  ? error.message
                  : 'This section could not load.',
            ),
            data: (items) {
              if (items.isEmpty) {
                return const _RailMessage(message: 'Nothing here right now.');
              }
              return ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
                itemCount: items.length,
                separatorBuilder: (_, _) =>
                    const SizedBox(width: AppSpacing.md),
                itemBuilder: (context, index) {
                  final title = items[index];
                  return PosterCard(
                    title: title.title,
                    mediaType: title.mediaType,
                    posterPath: title.posterPath,
                    year: title.year,
                    onTap: () => onTitleTap(title),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

class _RailMessage extends StatelessWidget {
  const _RailMessage({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          message,
          style: theme.textTheme.bodyMedium
              ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
        ),
      ),
    );
  }
}
