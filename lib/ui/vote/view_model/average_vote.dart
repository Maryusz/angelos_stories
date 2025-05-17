import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:angelos_stories/ui/vote/view_model/vote_view_model.dart';

part 'average_vote.g.dart';

@Riverpod(keepAlive: true)
Future<double> averageVote(Ref ref, {required int storyId}) async {
  final votes = await ref.watch(voteViewModelProvider.future);

  final filteredVotes = votes.where((vote) => vote.storyId == storyId).toList();
  if (filteredVotes.isEmpty) {
    return 0;
  }
  final totalVotes = filteredVotes.fold<double>(0, (sum, vote) => sum + vote.vote);
  final average = totalVotes / filteredVotes.length;
  return average;
}
