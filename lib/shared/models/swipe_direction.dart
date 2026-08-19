/// The three-direction swipe scheme.
///
/// Stored as the enum's `name` in `swipes.direction` and exported as
/// `direction`, so these names are a persistence contract.
enum SwipeDirection {
  /// Interested. In Discover this adds to the watchlist; in Backlog it
  /// shortlists for the current session only.
  right,

  /// Skip. In Discover the decision is recorded and the title does not
  /// reappear; in Backlog it is a session-only pass.
  left,

  /// Swipe up — a permanent, global "never show me this again" that applies
  /// across every deck and every buddy.
  dismiss;

  String get label => switch (this) {
        SwipeDirection.right => 'Interested',
        SwipeDirection.left => 'Skip',
        SwipeDirection.dismiss => 'Never show this',
      };
}
