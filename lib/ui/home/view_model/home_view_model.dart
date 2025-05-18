import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:angelos_stories/data/repositories/stories_repository.dart';
import 'package:angelos_stories/domain/models/story.dart';
part 'home_view_model.g.dart';

@riverpod
class HomeViewModel extends _$HomeViewModel {
  @override
  int build() {
    return 0;
  }

  Future<void> addStory(Story story) async {
    final storiesRepository = ref.read(storiesRepositoryProvider);
    await storiesRepository.addStory(story);
  }
}
