import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

import 'package:angelos_stories/data/repositories/votes_repository.dart';
import 'package:angelos_stories/domain/models/vote.dart';
import 'package:angelos_stories/ui/vote/view_model/local_vote_checker.dart';

class Voter extends ConsumerStatefulWidget {
  const Voter({super.key, required this.storyId});
  final int storyId;

  @override
  ConsumerState<Voter> createState() => _VoterState();
}

class _VoterState extends ConsumerState<Voter> {
  double _value = 0;

  void _onChanged(double value) {
    setState(() {
      _value = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Basic(
      title: Text('Vote'),
      subtitle: StarRating(
        value: _value,

        onChanged: (value) async {
          // This avoids the movement of the layout while voting
          Future.delayed(const Duration(milliseconds: 100));
          _onChanged(value);
        },
      ),
      content:
          _value != 0
              ? OutlineButton(
                child: Icon(LucideIcons.send),
                onPressed: () async {
                  if (ref.read(localVoteCheckerProvider).any((vote) => vote.storyId == widget.storyId)) {
                    showToast(
                      context: context,
                      builder:
                          (context, overlay) => SurfaceCard(
                            child: Basic(
                              title: const Text('Vote'),
                              subtitle: const Text('You already voted!'),
                              content: const Icon(LucideIcons.x),
                            ),
                          ),
                      location: ToastLocation.bottomLeft,
                    );
                    return;
                  }

                  final vote = Vote(storyId: widget.storyId, vote: _value);
                  final votesRepo = ref.read(votesRepositoryProvider);
                  await votesRepo.add(vote).then((value) {
                    if (context.mounted) {
                      showToast(
                        context: context,
                        builder:
                            (context, overlay) => SurfaceCard(
                              child: Basic(
                                title: const Text('Vote'),
                                subtitle: const Text('Vote sent!'),
                                content: const Icon(LucideIcons.check),
                              ),
                            ),
                        location: ToastLocation.bottomLeft,
                      );
                    }
                    ref.invalidate(votesRepositoryProvider);

                    ref.read(localVoteCheckerProvider.notifier).addVote(vote);
                  });
                },
              )
              : const Text('Please select a rating!'),
    );
  }
}
