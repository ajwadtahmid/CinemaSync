import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/placeholder_screen.dart';

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
              builder: (_, _) => const PlaceholderScreen(
                title: 'Library',
                icon: Icons.video_library_outlined,
                message:
                    'Your watchlist, ratings, custom lists and buddy matches '
                    'live here — on this device, and nowhere else.',
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppTab.search.path,
              builder: (_, _) => const PlaceholderScreen(
                title: 'Search',
                icon: Icons.search_outlined,
                message: 'Search the full TMDB catalogue for movies and TV.',
              ),
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
