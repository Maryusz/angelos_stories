import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:angelos_stories/data/repositories/stories_repository.dart';
import 'package:angelos_stories/ui/vote/view_model/average_vote.dart';
part 'stats_view_model.g.dart';

@Riverpod(keepAlive: true)
class StatsViewModel extends _$StatsViewModel {
  @override
  Future<List<Map<String, dynamic>>> build() async {
    // get all the stories from the stories repo
    final repo = ref.read(storiesRepositoryProvider);
    final stories = await repo.getAllStories();

    final result = <Map<String, dynamic>>[];
    for (var s in stories) {
      final dynamic avg = await ref.watch(averageVoteProvider(storyId: s.id).future);
      result.add({'title': s.title, 'vote': avg});
    }
    return result;
  }
}
