import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/db/daos/library_dao.dart';
import '../../../core/error/failure.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../shared/models/entry_status.dart';
import '../../../shared/models/library_sort.dart';
import '../../../shared/widgets/app_loader.dart';
import '../../../shared/widgets/empty_state.dart';
import '../../../shared/widgets/error_view.dart';
import '../../../shared/widgets/poster_card.dart';
import '../application/library_providers.dart';
import 'entry_detail_sheet.dart';

/// The tracker half of the app: everything the user has added, filtered,
/// sorted and searched with no network dependency.
class LibraryScreen extends ConsumerWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(libraryItemsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Library'),
        actions: [
          IconButton(
            icon: const Icon(Icons.playlist_play),
            tooltip: 'Lists',
            onPressed: () => context.push('/library/lists'),
          ),
          const _SortMenuButton(),
        ],
      ),
      body: Column(
        children: [
          const _SearchField(),
          const _StatusFilterRow(),
          Expanded(
            child: items.when(
              loading: () => const AppLoader(),
              error: (error, _) => ErrorView(
                message: error is Failure
                    ? error.message
                    : 'The library could not be loaded.',
                onRetry: () => ref.invalidate(libraryItemsProvider),
              ),
              data: (entries) => _LibraryGrid(entries: entries),
            ),
          ),
        ],
      ),
    );
  }
}

class _SearchField extends ConsumerWidget {
  const _SearchField();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final query = ref.watch(librarySearchProvider);

    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.lg,
        AppSpacing.md,
        AppSpacing.lg,
        AppSpacing.sm,
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search your library',
          prefixIcon: const Icon(Icons.search),
          suffixIcon: query.isEmpty
              ? null
              : IconButton(
                  icon: const Icon(Icons.clear),
                  tooltip: 'Clear search',
                  onPressed: () =>
                      ref.read(librarySearchProvider.notifier).clear(),
                ),
        ),
        onChanged: (value) =>
            ref.read(librarySearchProvider.notifier).set(value),
        controller: TextEditingController(text: query)
          ..selection = TextSelection.collapsed(offset: query.length),
      ),
    );
  }
}

class _StatusFilterRow extends ConsumerWidget {
  const _StatusFilterRow();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeStatus = ref.watch(libraryStatusProvider);
    final counts = ref.watch(libraryStatusCountsProvider).value;
    final total = counts?.values.fold(0, (a, b) => a + b) ?? 0;

    return SizedBox(
      height: 44,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
        children: [
          _FilterChip(
            label: 'All',
            count: total,
            selected: activeStatus == null,
            onSelected: () =>
                ref.read(libraryStatusProvider.notifier).set(null),
          ),
          const SizedBox(width: AppSpacing.sm),
          for (final status in EntryStatus.values) ...[
            _FilterChip(
              label: status.label,
              count: counts?[status] ?? 0,
              selected: activeStatus == status,
              onSelected: () =>
                  ref.read(libraryStatusProvider.notifier).set(status),
            ),
            const SizedBox(width: AppSpacing.sm),
          ],
        ],
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  const _FilterChip({
    required this.label,
    required this.count,
    required this.selected,
    required this.onSelected,
  });

  final String label;
  final int count;
  final bool selected;
  final VoidCallback onSelected;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text('$label · $count'),
      selected: selected,
      onSelected: (_) => onSelected(),
    );
  }
}

class _SortMenuButton extends ConsumerWidget {
  const _SortMenuButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sort = ref.watch(librarySortProvider);

    return PopupMenuButton<LibrarySort>(
      icon: const Icon(Icons.sort),
      tooltip: 'Sort',
      initialValue: sort,
      onSelected: (value) => ref.read(librarySortProvider.notifier).set(value),
      itemBuilder: (context) => [
        for (final option in LibrarySort.values)
          PopupMenuItem(value: option, child: Text(option.label)),
      ],
    );
  }
}

class _LibraryGrid extends StatelessWidget {
  const _LibraryGrid({required this.entries});

  final List<LibraryItem> entries;

  @override
  Widget build(BuildContext context) {
    if (entries.isEmpty) {
      return EmptyState(
        icon: Icons.video_library_outlined,
        title: 'Nothing here yet',
        message: 'Search the catalogue to add your first title.',
        actionLabel: 'Search',
        onAction: () => context.go('/search'),
      );
    }

    return GridView.builder(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.lg,
        AppSpacing.sm,
        AppSpacing.lg,
        AppSpacing.xl,
      ),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 140,
        childAspectRatio: 0.48,
        crossAxisSpacing: AppSpacing.md,
        mainAxisSpacing: AppSpacing.lg,
      ),
      itemCount: entries.length,
      itemBuilder: (context, index) {
        final item = entries[index];
        final title = item.title;

        return PosterCard(
          title: title?.title ?? 'Unknown title',
          mediaType: item.entry.mediaType,
          posterPath: title?.posterPath,
          year: title?.year,
          // Opens the editor directly — this is the tracker, not the
          // browser. The sheet itself links to full title detail.
          onTap: () => showEntryDetailSheet(
            context,
            id: item.entry.tmdbId,
            mediaType: item.entry.mediaType,
            title: title?.title,
          ),
        );
      },
    );
  }
}
