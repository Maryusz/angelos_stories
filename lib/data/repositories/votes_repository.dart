import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:angelos_stories/config/dependencies.dart';
import 'package:angelos_stories/domain/models/vote.dart';

part 'votes_repository.g.dart';

@riverpod
VotesRepository votesRepository(Ref ref) {
  final client = ref.watch(supabaseClientProvider);
  return VotesRepository(client: client);
}

class VotesRepository {
  final SupabaseClient _client;

  VotesRepository({required SupabaseClient client}) : _client = client;

  Future<List<Vote>> getAll() async {
    final response = await _client.from('votes').select();

    return response.map((e) => Vote.fromJson(e)).toList();
  }

  Future<void> add(Vote vote) async {
    var js = vote.toJson();
    js.remove('id');
    await _client.from('votes').insert(vote.toJson());
  }
}
