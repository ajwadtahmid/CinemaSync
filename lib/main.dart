import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';
import 'core/db/database.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final container = ProviderContainer();

  // Open the database before the first frame. It is the source of truth, not a
  // cache, so there is no meaningful UI to show without it — and opening it
  // eagerly surfaces a corrupt or unwritable file at launch rather than midway
  // through a user's first interaction.
  await container.read(appDatabaseProvider).customStatement('SELECT 1');

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const CinemaSyncApp(),
    ),
  );
}
