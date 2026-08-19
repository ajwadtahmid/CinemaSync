/// Where a title sits in the user's library.
///
/// Stored as the enum's `name` in the `library_entries.status` column and
/// written verbatim to the export format's `status` field, so these names are
/// a persistence contract — renaming one requires a migration and an export
/// schema bump.
enum EntryStatus {
  watchlist,
  watching,
  watched,
  dropped;

  String get label => switch (this) {
        EntryStatus.watchlist => 'Watchlist',
        EntryStatus.watching => 'Watching',
        EntryStatus.watched => 'Watched',
        EntryStatus.dropped => 'Dropped',
      };

  /// Statuses that exclude a title from Discover decks: the user has already
  /// formed an opinion, so there is nothing left to decide.
  static const Set<EntryStatus> decided = {
    EntryStatus.watched,
    EntryStatus.dropped,
  };
}
