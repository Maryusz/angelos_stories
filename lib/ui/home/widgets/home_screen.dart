import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

import 'package:angelos_stories/domain/models/story.dart';
import 'package:angelos_stories/ui/boomerctionary/widgets/boomerciotnary_link_button.dart';
import 'package:angelos_stories/ui/home/view_model/home_view_model.dart';
import 'package:angelos_stories/ui/home/widgets/add_story_dialog.dart';
import 'package:angelos_stories/utils/env_service.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  Widget buildToast(BuildContext context, ToastOverlay overlay) {
    return SurfaceCard(
      child: Basic(title: const Text('Really?'), subtitle: Text('No story?'), content: Image.asset('assets/img/nostory.gif')),
    );
  }

  void _showToast(BuildContext context) {
    showToast(context: context, builder: buildToast, location: ToastLocation.bottomLeft);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      child: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 8,
              children: [
                Text('Angelo\'s Stories').x6Large,
                Text('Every story comes from a man who wants to tell it, whether you want it or not.').thin,
                Text('- Angelo R.').xSmall,
                AnimatedContainer(duration: Duration(milliseconds: 1500), child: ref.watch(imageLoaderProvider)),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SizedBox(
                      width: 600,
                      height: 128,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: MouseRegion(
                              onHover: (event) => ref.read(homeViewModelProvider.notifier).choice(1),
                              onExit: (event) => ref.read(homeViewModelProvider.notifier).choice(0),
                              child: PrimaryButton(
                                leading: Icon(LucideIcons.feather),

                                child: Basic(title: Text('I am Angelo').mono, titleSpacing: 16),
                                onPressed: () async {
                                  final story = await showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AddStoryDialog();
                                    },
                                  );

                                  if (story == null && context.mounted) {
                                    _showToast(context);
                                    return;
                                  }

                                  final s = jsonEncode(
                                    story.map((key, value) {
                                      return MapEntry(key.key, value);
                                    }),
                                  );

                                  ref.read(homeViewModelProvider.notifier).addStory(Story.fromJson(jsonDecode(s)));
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            child: MouseRegion(
                              onHover: (event) => ref.read(homeViewModelProvider.notifier).choice(2),
                              onExit: (event) => ref.read(homeViewModelProvider.notifier).choice(0),
                              child: PrimaryButton(
                                leading: Icon(LucideIcons.bookHeart),

                                onHover: (value) {
                                  ref.read(homeViewModelProvider.notifier).choice(2);
                                },
                                onPressed: () => context.pushReplacementNamed('stories'),
                                child: Basic(title: Text('I\'m not Angelo').mono, titleSpacing: 16),
                              ),
                            ),
                          ),
                          Expanded(
                            child: MouseRegion(
                              onHover: (event) => ref.read(homeViewModelProvider.notifier).choice(3),
                              onExit: (event) => ref.read(homeViewModelProvider.notifier).choice(0),
                              child: PrimaryButton(
                                leading: Icon(LucideIcons.chartArea),
                                onPressed: () => context.pushReplacementNamed('stats'),
                                child: Basic(title: Text('Stats').mono, titleSpacing: 16),
                              ),
                            ),
                          ),
                        ],
                      ).gap(12),
                    ),
                  ),
                ),
                MouseRegion(
                  onHover: (event) => ref.read(homeViewModelProvider.notifier).choice(4),
                  onExit: (event) => ref.read(homeViewModelProvider.notifier).choice(0),
                  child: BoomerciotnaryLinkButton(),
                ),
                const Gap(12),
                Text('This app is open source!').xSmall,
                Text('You can find it on GitHub').xSmall,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
