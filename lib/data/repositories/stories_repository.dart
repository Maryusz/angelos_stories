import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:angelos_stories/config/dependencies.dart';
import 'package:angelos_stories/domain/models/story.dart';

part 'stories_repository.g.dart';

@riverpod
StoriesRepository storiesRepository(Ref ref) {
  final client = ref.watch(supabaseClientProvider);
  return StoriesRepository(client: client);
}

class StoriesRepository {
  final SupabaseClient _client;

  StoriesRepository({required SupabaseClient client}) : _client = client;

  Future<List<Story>> getAllStories() async {
    final response = await _client.from('stories').select().order('id', ascending: true);
    return response.map((e) => Story.fromJson(e)).toList();
  }

  Future<void> addStory(Story story) async {
    var js = story.toJson();

    js.remove('id');
    await _client.from('stories').insert(js);
  }
}
