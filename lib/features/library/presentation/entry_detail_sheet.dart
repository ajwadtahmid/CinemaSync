import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/router/routes.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../shared/models/entry_status.dart';
import '../../../shared/models/media_type.dart';
import '../../../shared/widgets/app_loader.dart';
import '../application/library_providers.dart';
import '../data/library_repository.dart';

/// Opens the rating/status/notes editor for a single tracked title.
Future<void> showEntryDetailSheet(
  BuildContext context, {
  required int id,
  required MediaType mediaType,
  String? title,
}) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    builder: (_) =>
        EntryDetailSheet(id: id, mediaType: mediaType, title: title),
  );
}

/// Everything editable about one library entry: status, rating, watch date,
/// notes, rewatch count. Every control writes immediately — there is no
/// separate save step, matching how the rest of the library behaves.
class EntryDetailSheet extends ConsumerWidget {
  const EntryDetailSheet({
    super.key,
    required this.id,
    required this.mediaType,
    this.title,
  });

  final int id;
  final MediaType mediaType;
  final String? title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final entryAsync =
        ref.watch(libraryEntryProvider((id: id, mediaType: mediaType)));

    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      minChildSize: 0.4,
      maxChildSize: 0.95,
      expand: false,
      builder: (context, scrollController) {
        return entryAsync.when(
          loading: () => const AppLoader(),
          error: (_, _) =>
              const Center(child: Text('Could not load this entry.')),
          data: (entry) {
            if (entry == null) {
              // The sheet was opened for a title that is not (or is no
              // longer) tracked — close rather than show a stale form.
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (context.mounted) Navigator.of(context).pop();
              });
              return const SizedBox.shrink();
            }
            return _EntryForm(
              entryId: entry.id,
              tmdbId: entry.tmdbId,
              mediaType: entry.mediaType,
              status: entry.status,
              rating: entry.rating,
              watchedAt: entry.watchedAt,
              notes: entry.notes,
              rewatchCount: entry.rewatchCount,
              title: title,
              scrollController: scrollController,
            );
          },
        );
      },
    );
  }
}

class _EntryForm extends ConsumerStatefulWidget {
  const _EntryForm({
    required this.entryId,
    required this.tmdbId,
    required this.mediaType,
    required this.status,
    required this.rating,
    required this.watchedAt,
    required this.notes,
    required this.rewatchCount,
    required this.title,
    required this.scrollController,
  });

  final int entryId;
  final int tmdbId;
  final MediaType mediaType;
  final EntryStatus status;
  final double? rating;
  final DateTime? watchedAt;
  final String? notes;
  final int rewatchCount;
  final String? title;
  final ScrollController scrollController;

  @override
  ConsumerState<_EntryForm> createState() => _EntryFormState();
}

class _EntryFormState extends ConsumerState<_EntryForm> {
  late final TextEditingController _notesController;

  @override
  void initState() {
    super.initState();
    _notesController = TextEditingController(text: widget.notes ?? '');
  }

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  LibraryRepository get _repo => ref.read(libraryRepositoryProvider);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListView(
      controller: widget.scrollController,
      padding: const EdgeInsets.all(AppSpacing.lg),
      children: [
        Center(
          child: Container(
            width: 36,
            height: 4,
            margin: const EdgeInsets.only(bottom: AppSpacing.lg),
            decoration: BoxDecoration(
              color: theme.colorScheme.outlineVariant,
              borderRadius: BorderRadius.circular(AppRadius.pill),
            ),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.title != null)
              Expanded(
                child: Text(widget.title!, style: theme.textTheme.titleLarge),
              ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                context.push(titleDetailPath(widget.tmdbId, widget.mediaType));
              },
              child: const Text('View details'),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.lg),
        Text('Status', style: theme.textTheme.titleSmall),
        const SizedBox(height: AppSpacing.sm),
        Wrap(
          spacing: AppSpacing.sm,
          children: [
            for (final status in EntryStatus.values)
              ChoiceChip(
                label: Text(status.label),
                selected: status == widget.status,
                onSelected: (_) => _repo.setStatus(widget.entryId, status),
              ),
          ],
        ),
        const SizedBox(height: AppSpacing.xl),
        Text('Your rating', style: theme.textTheme.titleSmall),
        const SizedBox(height: AppSpacing.sm),
        _RatingControl(
          rating: widget.rating,
          onChanged: (value) => _repo.setRating(widget.entryId, value),
        ),
        const SizedBox(height: AppSpacing.xl),
        Text('Watch date', style: theme.textTheme.titleSmall),
        const SizedBox(height: AppSpacing.sm),
        _WatchDateControl(
          watchedAt: widget.watchedAt,
          onChanged: (value) => _repo.setWatchedAt(widget.entryId, value),
        ),
        const SizedBox(height: AppSpacing.xl),
        Text('Rewatches', style: theme.textTheme.titleSmall),
        const SizedBox(height: AppSpacing.sm),
        _RewatchControl(
          count: widget.rewatchCount,
          onChanged: (value) => _repo.setRewatchCount(widget.entryId, value),
        ),
        const SizedBox(height: AppSpacing.xl),
        Text('Notes', style: theme.textTheme.titleSmall),
        const SizedBox(height: AppSpacing.sm),
        TextField(
          controller: _notesController,
          maxLines: 4,
          decoration: const InputDecoration(hintText: 'Private notes'),
          onChanged: (value) => _repo.setNotes(widget.entryId, value),
        ),
        const SizedBox(height: AppSpacing.xl),
        OutlinedButton.icon(
          onPressed: () => _confirmRemove(context),
          icon: Icon(Icons.delete_outline, color: theme.colorScheme.error),
          label: Text(
            'Remove from library',
            style: TextStyle(color: theme.colorScheme.error),
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
      ],
    );
  }

  Future<void> _confirmRemove(BuildContext context) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Remove from library?'),
        content: const Text(
          'This deletes your rating, notes and watch date for this title.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Remove'),
          ),
        ],
      ),
    );
    if (confirmed != true || !context.mounted) return;

    await _repo.removeFromLibrary(widget.entryId);
    if (context.mounted) Navigator.of(context).pop();
  }
}

/// A 0.5–10 half-step rating slider.
///
/// A slider snapped to half-steps, rather than a tappable star row: it is one
/// standard, accessible widget instead of hand-rolled half-cell hit-testing,
/// and it cannot produce a value the database's CHECK constraint would reject.
class _RatingControl extends StatelessWidget {
  const _RatingControl({required this.rating, required this.onChanged});

  final double? rating;
  final ValueChanged<double?> onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // 0 on the slider means "no rating"; 0.5–10 map directly.
    final sliderValue = rating ?? 0;

    return Row(
      children: [
        Icon(Icons.star_rounded, color: AppColors.rating, size: 20),
        Expanded(
          child: Slider(
            value: sliderValue,
            min: 0,
            max: 10,
            divisions: 20,
            label: rating == null ? 'Unrated' : _formatRating(rating!),
            onChanged: (value) => onChanged(value == 0 ? null : value),
          ),
        ),
        SizedBox(
          width: 40,
          child: Text(
            rating == null ? '—' : _formatRating(rating!),
            style: theme.textTheme.titleMedium,
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
  }

  static String _formatRating(double rating) => rating == rating.roundToDouble()
      ? rating.toStringAsFixed(0)
      : rating.toStringAsFixed(1);
}

class _WatchDateControl extends StatelessWidget {
  const _WatchDateControl({required this.watchedAt, required this.onChanged});

  final DateTime? watchedAt;
  final ValueChanged<DateTime?> onChanged;

  @override
  Widget build(BuildContext context) {
    final local = watchedAt?.toLocal();
    final label = local == null
        ? 'Not set'
        : '${local.year}-${local.month.toString().padLeft(2, '0')}-'
            '${local.day.toString().padLeft(2, '0')}';

    return Row(
      children: [
        Expanded(child: Text(label)),
        TextButton(
          onPressed: () async {
            final picked = await showDatePicker(
              context: context,
              initialDate: local ?? DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
            );
            if (picked != null) onChanged(picked);
          },
          child: const Text('Pick date'),
        ),
        if (watchedAt != null)
          IconButton(
            icon: const Icon(Icons.clear, size: 18),
            tooltip: 'Clear date',
            onPressed: () => onChanged(null),
          ),
      ],
    );
  }
}

class _RewatchControl extends StatelessWidget {
  const _RewatchControl({required this.count, required this.onChanged});

  final int count;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.remove_circle_outline),
          onPressed: count > 0 ? () => onChanged(count - 1) : null,
          tooltip: 'Fewer rewatches',
        ),
        Text('$count', style: Theme.of(context).textTheme.titleMedium),
        IconButton(
          icon: const Icon(Icons.add_circle_outline),
          onPressed: () => onChanged(count + 1),
          tooltip: 'More rewatches',
        ),
      ],
    );
  }
}
