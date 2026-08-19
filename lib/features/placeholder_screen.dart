import 'package:flutter/material.dart';

import '../shared/widgets/empty_state.dart';

/// Stands in for a screen that a later phase builds.
///
/// Deliberately one shared widget rather than four near-identical stubs: these
/// are scaffolding, and each will be deleted outright when its real screen
/// lands rather than grown into it.
class PlaceholderScreen extends StatelessWidget {
  const PlaceholderScreen({
    super.key,
    required this.title,
    required this.icon,
    required this.message,
  });

  final String title;
  final IconData icon;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: EmptyState(icon: icon, title: title, message: message),
    );
  }
}
