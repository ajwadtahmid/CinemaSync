import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/error/failure.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../shared/widgets/app_loader.dart';
import '../../../shared/widgets/empty_state.dart';
import '../../../shared/widgets/error_view.dart';
import '../application/lists_providers.dart';
import '../data/lists_repository.dart';

/// The index of the user's custom lists.
class ListsScreen extends ConsumerWidget {
  const ListsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lists = ref.watch(listsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Lists')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _createList(context, ref),
        tooltip: 'New list',
        child: const Icon(Icons.add),
      ),
      body: lists.when(
        loading: () => const AppLoader(),
        error: (error, _) => ErrorView(
          message: error is Failure ? error.message : 'Lists could not load.',
          onRetry: () => ref.invalidate(listsProvider),
        ),
        data: (items) {
          if (items.isEmpty) {
            return EmptyState(
              icon: Icons.playlist_add,
              title: 'No lists yet',
              message: 'Group titles however makes sense to you — a genre, a '
                  'mood, a rewatch queue.',
              actionLabel: 'Create a list',
              onAction: () => _createList(context, ref),
            );
          }
          return ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
            itemCount: items.length,
            separatorBuilder: (_, _) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final entry = items[index];
              return ListTile(
                title: Text(entry.list.name),
                subtitle: Text('${entry.itemCount} titles'),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => context.push('/library/lists/${entry.list.id}'),
              );
            },
          );
        },
      ),
    );
  }

  Future<void> _createList(BuildContext context, WidgetRef ref) async {
    final controller = TextEditingController();
    final name = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('New list'),
        content: TextField(
          controller: controller,
          autofocus: true,
          decoration: const InputDecoration(hintText: 'List name'),
          onSubmitted: (value) => Navigator.of(context).pop(value),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(controller.text),
            child: const Text('Create'),
          ),
        ],
      ),
    );

    if (name == null || name.trim().isEmpty || !context.mounted) return;
    final id = await ref.read(listsRepositoryProvider).createList(name);
    if (context.mounted) context.push('/library/lists/$id');
  }
}
