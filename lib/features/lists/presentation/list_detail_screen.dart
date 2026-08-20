import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/error/failure.dart';
import '../../../core/router/routes.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../shared/models/list_sort_preference.dart';
import '../../../shared/models/media_type.dart';
import '../../../shared/widgets/app_loader.dart';
import '../../../shared/widgets/empty_state.dart';
import '../../../shared/widgets/error_view.dart';
import '../../../shared/widgets/poster_card.dart';
import '../application/lists_providers.dart';
import '../data/lists_repository.dart';

/// One list's contents, ordered by that list's own sort preference.
class ListDetailScreen extends ConsumerWidget {
  const ListDetailScreen({super.key, required this.listId});

  final int listId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final list = ref.watch(listProvider(listId));
    final items = ref.watch(listItemsProvider(listId));

    return Scaffold(
      appBar: AppBar(
        title: Text(list.value?.name ?? 'List'),
        actions: [
          if (list.value != null)
            _SortMenu(listId: listId, current: list.value!.sortPreference),
          IconButton(
            icon: const Icon(Icons.more_vert),
            tooltip: 'List options',
            onPressed: () =>
                _showOptions(context, ref, list.value?.name ?? ''),
          ),
        ],
      ),
      body: items.when(
        loading: () => const AppLoader(),
        error: (error, _) => ErrorView(
          message:
              error is Failure ? error.message : 'This list could not load.',
          onRetry: () => ref.invalidate(listItemsProvider(listId)),
        ),
        data: (entries) {
          if (entries.isEmpty) {
            return const EmptyState(
              icon: Icons.movie_filter_outlined,
              title: 'Nothing on this list yet',
              message: "Add titles from any title's detail screen.",
            );
          }
          return GridView.builder(
            padding: const EdgeInsets.all(AppSpacing.lg),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 140,
              childAspectRatio: 0.48,
              crossAxisSpacing: AppSpacing.md,
              mainAxisSpacing: AppSpacing.lg,
            ),
            itemCount: entries.length,
            itemBuilder: (context, index) {
              final entry = entries[index];
              final title = entry.title;

              return GestureDetector(
                onLongPress: () => _showItemOptions(
                  context,
                  ref,
                  entry.item.tmdbId,
                  entry.item.mediaType,
                  title?.title,
                  entry.item.notes,
                ),
                child: Stack(
                  children: [
                    PosterCard(
                      title: title?.title ?? 'Unknown title',
                      mediaType: entry.item.mediaType,
                      posterPath: title?.posterPath,
                      year: title?.year,
                      onTap: () => context.push(
                        titleDetailPath(
                          entry.item.tmdbId,
                          entry.item.mediaType,
                        ),
                      ),
                    ),
                    if (entry.item.notes != null)
                      const Positioned(
                        top: 4,
                        right: 4,
                        child: Icon(Icons.sticky_note_2_outlined, size: 16),
                      ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  Future<void> _showItemOptions(
    BuildContext context,
    WidgetRef ref,
    int tmdbId,
    MediaType mediaType,
    String? title,
    String? currentNote,
  ) async {
    final action = await showModalBottomSheet<String>(
      context: context,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.sticky_note_2_outlined),
              title: Text(currentNote == null ? 'Add note' : 'Edit note'),
              subtitle: currentNote == null ? null : Text(currentNote),
              onTap: () => Navigator.of(context).pop('note'),
            ),
            ListTile(
              leading: const Icon(Icons.delete_outline),
              title: const Text('Remove from list'),
              onTap: () => Navigator.of(context).pop('remove'),
            ),
          ],
        ),
      ),
    );
    if (!context.mounted || action == null) return;

    if (action == 'note') {
      final controller = TextEditingController(text: currentNote ?? '');
      final note = await showDialog<String>(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Note for ${title ?? "this title"}'),
          content: TextField(
            controller: controller,
            autofocus: true,
            maxLines: 3,
            decoration: const InputDecoration(
              hintText: 'Why is this on the list?',
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(controller.text),
              child: const Text('Save'),
            ),
          ],
        ),
      );
      if (note != null) {
        await ref
            .read(listsRepositoryProvider)
            .setItemNotes(listId, tmdbId, mediaType, note);
      }
    } else if (action == 'remove') {
      final confirmed = await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Remove ${title ?? "this title"}?'),
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
      if (confirmed == true) {
        await ref
            .read(listsRepositoryProvider)
            .removeItem(listId, tmdbId, mediaType);
      }
    }
  }

  Future<void> _showOptions(
    BuildContext context,
    WidgetRef ref,
    String currentName,
  ) async {
    final action = await showModalBottomSheet<String>(
      context: context,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.edit_outlined),
              title: const Text('Rename'),
              onTap: () => Navigator.of(context).pop('rename'),
            ),
            ListTile(
              leading: const Icon(Icons.delete_outline),
              title: const Text('Delete list'),
              onTap: () => Navigator.of(context).pop('delete'),
            ),
          ],
        ),
      ),
    );

    if (!context.mounted || action == null) return;

    if (action == 'rename') {
      final controller = TextEditingController(text: currentName);
      final name = await showDialog<String>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Rename list'),
          content: TextField(controller: controller, autofocus: true),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(controller.text),
              child: const Text('Save'),
            ),
          ],
        ),
      );
      if (name != null && name.trim().isNotEmpty) {
        await ref.read(listsRepositoryProvider).renameList(listId, name);
      }
    } else if (action == 'delete') {
      final confirmed = await showDialog<bool>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Delete this list?'),
          content: const Text('The titles themselves stay in your library.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('Delete'),
            ),
          ],
        ),
      );
      if (confirmed == true) {
        await ref.read(listsRepositoryProvider).deleteList(listId);
        if (context.mounted) context.pop();
      }
    }
  }
}

class _SortMenu extends ConsumerWidget {
  const _SortMenu({required this.listId, required this.current});

  final int listId;
  final ListSortPreference current;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopupMenuButton<ListSortPreference>(
      icon: const Icon(Icons.sort),
      tooltip: 'Sort',
      initialValue: current,
      onSelected: (value) =>
          ref.read(listsRepositoryProvider).setSortPreference(listId, value),
      itemBuilder: (context) => [
        for (final option in ListSortPreference.values)
          PopupMenuItem(value: option, child: Text(option.label)),
      ],
    );
  }
}
