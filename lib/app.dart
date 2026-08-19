import 'package:flutter/material.dart';

import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';

/// The root widget.
///
/// Dark is the designed experience; light exists so the system setting is
/// respected rather than overridden.
class CinemaSyncApp extends StatelessWidget {
  const CinemaSyncApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'CinemaSync',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      routerConfig: appRouter,
    );
  }
}
