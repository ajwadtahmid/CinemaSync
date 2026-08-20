import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/catalog/presentation/catalog_screen.dart';
import '../../features/library/presentation/library_screen.dart';
import '../../features/lists/presentation/list_detail_screen.dart';
import '../../features/lists/presentation/lists_screen.dart';
import '../../features/placeholder_screen.dart';
import '../../features/title_detail/presentation/title_detail_screen.dart';
import '../../shared/models/media_type.dart';
import 'routes.dart';

/// The four top-level destinations.
///
/// Discover comes first — the swipe deck is the signature feature and the
/// most repeated action. Library is second, and covers custom lists and
/// buddy watch-together matches alongside the tracked titles themselves.
enum AppTab {
  discover('/discover', 'Discover', Icons.style_outlined, Icons.style),
  library(
    '/library',
    'Library',
    Icons.video_library_outlined,
    Icons.video_library,
  ),
  search('/search', 'Search', Icons.search_outlined, Icons.search),
  settings('/settings', 'Settings', Icons.settings_outlined, Icons.settings);

  const AppTab(this.path, this.label, this.icon, this.selectedIcon);

  final String path;
  final String label;
  final IconData icon;
  final IconData selectedIcon;
}

final GoRouter appRouter = GoRouter(
  initialLocation: AppTab.discover.path,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          _AppShell(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppTab.discover.path,
              builder: (_, _) => const PlaceholderScreen(
                title: 'Discover',
                icon: Icons.style_outlined,
                message:
                    'Swipe through new titles, or through your own backlog to '
                    'decide what to watch tonight.',
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppTab.library.path,
              builder: (_, _) => const LibraryScreen(),
              routes: [
                GoRoute(
                  path: 'lists',
                  builder: (_, _) => const ListsScreen(),
                  routes: [
                    GoRoute(
                      path: ':id',
                      builder: (context, state) {
                        final id =
                            int.tryParse(state.pathParameters['id'] ?? '');
                        if (id == null) {
                          return const PlaceholderScreen(
                            title: 'Not found',
                            icon: Icons.help_outline,
                            message: 'That link does not point to a list.',
                          );
                        }
                        return ListDetailScreen(listId: id);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppTab.search.path,
              builder: (_, _) => const CatalogScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppTab.settings.path,
              builder: (_, _) => const PlaceholderScreen(
                title: 'Settings',
                icon: Icons.settings_outlined,
                message:
                    'Export and import your data, point the app at your own '
                    'proxy, and see exactly what leaves this device.',
              ),
            ),
          ],
        ),
      ],
    ),

    // Top level rather than inside a branch: a title detail is pushed over the
    // whole shell, including the nav bar, and returns to whichever tab opened
    // it.
    GoRoute(
      path: titleDetailPattern,
      builder: (context, state) {
        final id = int.tryParse(state.pathParameters['id'] ?? '');
        final rawType = state.pathParameters['mediaType'];

        // A hand-typed or stale deep link should not crash the app.
        if (id == null || (rawType != 'movie' && rawType != 'tv')) {
          return const PlaceholderScreen(
            title: 'Not found',
            icon: Icons.help_outline,
            message: 'That link does not point to a title.',
          );
        }

        return TitleDetailScreen(
          id: id,
          mediaType: MediaType.fromTmdb(rawType),
        );
      },
    ),
  ],
);

class _AppShell extends StatelessWidget {
  const _AppShell({required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: (index) => navigationShell.goBranch(
          index,
          // Tapping the active tab returns it to its root, the platform
          // convention on both iOS and Android.
          initialLocation: index == navigationShell.currentIndex,
        ),
        destinations: [
          for (final tab in AppTab.values)
            NavigationDestination(
              icon: Icon(tab.icon),
              selectedIcon: Icon(tab.selectedIcon),
              label: tab.label,
              tooltip: tab.label,
            ),
        ],
      ),
    );
  }
}
