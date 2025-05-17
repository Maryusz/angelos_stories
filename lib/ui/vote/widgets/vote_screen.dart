import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

import 'package:angelos_stories/ui/vote/view_model/average_vote.dart';

class VoteScreen extends ConsumerWidget {
  const VoteScreen({super.key, required this.storyId});
  final int storyId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return switch (ref.watch(averageVoteProvider(storyId: storyId))) {
      AsyncError(:final error) => Text('$error'),
      AsyncData(:final value) => StarRating(value: value),
      _ => CircularProgressIndicator(),
    };
  }
}
