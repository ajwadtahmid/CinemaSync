/// How a single user-defined list orders its items.
///
/// Stored per list (not globally), so "Comfort rewatches" can stay hand-ordered
/// while "To watch in 2026" sorts by release year. Stored as the enum's `name`
/// in `user_lists.sort_preference`.
enum ListSortPreference {
  /// Hand-ordered by the user; `user_list_items.position` is authoritative.
  manual,
  dateAdded,
  title,
  rating,
  releaseYear;

  String get label => switch (this) {
        ListSortPreference.manual => 'Custom order',
        ListSortPreference.dateAdded => 'Date added',
        ListSortPreference.title => 'Title',
        ListSortPreference.rating => 'Your rating',
        ListSortPreference.releaseYear => 'Release year',
      };
}
