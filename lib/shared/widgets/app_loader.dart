import 'package:flutter/material.dart';

/// The single loading indicator used across the app.
class AppLoader extends StatelessWidget {
  const AppLoader({super.key, this.size = 28, this.label = 'Loading'});

  final double size;

  /// Announced by screen readers in place of the spinner itself.
  final String label;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Semantics(
        label: label,
        liveRegion: true,
        child: SizedBox(
          width: size,
          height: size,
          child: const CircularProgressIndicator(strokeWidth: 2.5),
        ),
      ),
    );
  }
}
