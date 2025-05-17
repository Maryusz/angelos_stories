import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
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

  void choice(int value) {
    state = value;
  }

  Future<void> addStory(Story story) async {
    final storiesRepository = ref.read(storiesRepositoryProvider);
    await storiesRepository.addStory(story);
  }
}

@riverpod
Image imageLoader(Ref ref) {
  final homeViewModel = ref.watch(homeViewModelProvider);
  final List<Image> images = [
    Image.asset('assets/img/anoldmanstalking.gif', cacheHeight: 366, cacheWidth: 480),
    Image.asset('assets/img/newstory.gif', cacheHeight: 366, cacheWidth: 480),
    Image.asset('assets/img/stories.gif', cacheHeight: 366, cacheWidth: 480),
    Image.asset('assets/img/poster.gif', cacheHeight: 366, cacheWidth: 480),
    Image.asset('assets/img/boomerctionary.gif', cacheHeight: 366, cacheWidth: 480),
  ];

  return images[homeViewModel];
}
