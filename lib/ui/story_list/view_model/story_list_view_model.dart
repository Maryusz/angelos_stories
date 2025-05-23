import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:angelos_stories/data/repositories/stories_repository.dart';
import 'package:angelos_stories/domain/models/story.dart';
part 'story_list_view_model.g.dart';

@Riverpod(keepAlive: true)
class StoryListViewModel extends _$StoryListViewModel {
  @override
  Future<List<Story>> build() async {
    final storiesRepository = ref.watch(storiesRepositoryProvider);

    final stories = await storiesRepository.getAllStories();

    return stories;
  }
}
