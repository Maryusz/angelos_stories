import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:angelos_stories/domain/models/vote.dart';
part 'local_vote_checker.g.dart';

/// This provider is used to check if the user has already voted for a story but it's local so
/// it doesn't persist the data if the session is refreshed.

@Riverpod(keepAlive: true)
class LocalVoteChecker extends _$LocalVoteChecker {
  @override
  List<Vote> build() {
    return [];
  }

  void addVote(Vote vote) {
    state = [...state, vote];
  }
}
