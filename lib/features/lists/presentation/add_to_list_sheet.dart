import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_spacing.dart';
import '../../../shared/models/media_type.dart';
import '../../../shared/widgets/app_loader.dart';
import '../application/lists_providers.dart';
import '../data/lists_repository.dart';

/// Lets the user toggle a title's membership across all their lists, with an
/// inline "new list" option so creating one doesn't require leaving the flow.
Future<void> showAddToListSheet(
  BuildContext context, {
  required int id,
  required MediaType mediaType,
  required String title,
}) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    builder: (_) =>
        AddToListSheet(id: id, mediaType: mediaType, title: title),
  );
}

class AddToListSheet extends ConsumerWidget {
  const AddToListSheet({
    super.key,
    required this.id,
    required this.mediaType,
    required this.title,
  });

  final int id;
  final MediaType mediaType;
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lists = ref.watch(listsProvider);
    final containing =
        ref.watch(listIdsContainingProvider((id: id, mediaType: mediaType)));
    final repo = ref.read(listsRepositoryProvider);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Add "$title" to a list',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: AppSpacing.md),
            lists.when(
              loading: () => const AppLoader(),
              error: (_, _) => const Text('Lists could not load.'),
              data: (items) {
                final memberOf = containing.value ?? {};
                if (items.isEmpty) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: AppSpacing.md),
                    child: Text('No lists yet — create one below.'),
                  );
                }
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (final entry in items)
                      CheckboxListTile(
                        contentPadding: EdgeInsets.zero,
                        controlAffinity: ListTileControlAffinity.leading,
                        title: Text(entry.list.name),
                        value: memberOf.contains(entry.list.id),
                        onChanged: (checked) => (checked ?? false)
                            ? repo.addItem(entry.list.id, id, mediaType)
                            : repo.removeItem(entry.list.id, id, mediaType),
                      ),
                  ],
                );
              },
            ),
            const SizedBox(height: AppSpacing.sm),
            OutlinedButton.icon(
              onPressed: () => _createAndAdd(context, ref),
              icon: const Icon(Icons.add, size: 18),
              label: const Text('New list'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _createAndAdd(BuildContext context, WidgetRef ref) async {
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
            child: const Text('Create and add'),
          ),
        ],
      ),
    );
    if (name == null || name.trim().isEmpty) return;

    final repo = ref.read(listsRepositoryProvider);
    final listId = await repo.createList(name);
    await repo.addItem(listId, id, mediaType);
  }
}
