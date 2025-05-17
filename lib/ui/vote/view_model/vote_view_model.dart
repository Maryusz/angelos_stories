import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:angelos_stories/data/repositories/votes_repository.dart';
import 'package:angelos_stories/domain/models/vote.dart';

part 'vote_view_model.g.dart';

@Riverpod(keepAlive: true)
class VoteViewModel extends _$VoteViewModel {
  @override
  FutureOr<List<Vote>> build() {
    final votesRepo = ref.watch(votesRepositoryProvider);
    return votesRepo.getAll();
  }
}
