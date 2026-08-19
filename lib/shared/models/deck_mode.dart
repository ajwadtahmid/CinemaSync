/// Which deck a swipe was made in.
///
/// Stored as the enum's `name` in `swipes.deck_mode` and exported as
/// `deck_mode`, so these names are a persistence contract.
enum DeckMode {
  /// New titles from TMDB, filtered by taste preferences.
  discover,

  /// The user's own watchlist, for deciding what to watch tonight. Fully
  /// offline and session-scoped — never mutates library status.
  backlog,

  /// The shared deck for a paired buddy. Always carries a `buddyId`.
  buddy;

  String get label => switch (this) {
        DeckMode.discover => 'Discover',
        DeckMode.backlog => 'Backlog',
        DeckMode.buddy => 'Buddy',
      };
}
