/// How the library list is ordered.
///
/// A view preference, not persisted state — it lives in a provider and is
/// passed to the query. Per-*list* ordering is a different concept that does
/// persist, and includes a hand-ordered mode the library has no equivalent
/// for; see `ListSortPreference`.
enum LibrarySort {
  dateAdded,
  rating,
  title,
  releaseYear;

  String get label => switch (this) {
        LibrarySort.dateAdded => 'Recently added',
        LibrarySort.rating => 'Your rating',
        LibrarySort.title => 'Title',
        LibrarySort.releaseYear => 'Release year',
      };
}
