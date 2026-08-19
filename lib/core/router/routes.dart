import '../../shared/models/media_type.dart';

/// Route paths, kept apart from the router itself so screens can build links
/// without importing `app_router.dart` — which imports the screens, and would
/// otherwise close an import cycle.

/// Pattern registered with go_router.
const String titleDetailPattern = '/title/:mediaType/:id';

/// A title's identity in the app is `(tmdbId, mediaType)`, so both appear in
/// the path. `/title/movie/27205` and `/title/tv/27205` are different titles.
String titleDetailPath(int id, MediaType mediaType) =>
    '/title/${mediaType.tmdbValue}/$id';
