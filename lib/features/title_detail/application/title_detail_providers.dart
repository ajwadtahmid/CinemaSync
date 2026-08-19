import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/models/media_type.dart';
import '../../../shared/models/title_detail.dart';
import '../../catalog/data/catalog_repository.dart';

/// Identity of a title. Always the pair — `tmdbId` alone is ambiguous, since a
/// movie and a series can share an id.
typedef TitleKey = ({int id, MediaType mediaType});

final titleDetailProvider =
    FutureProvider.autoDispose.family<TitleDetail, TitleKey>((ref, key) {
  return ref.watch(catalogRepositoryProvider).detail(key.id, key.mediaType);
});
