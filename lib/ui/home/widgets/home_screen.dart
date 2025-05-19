import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:angelos_stories/domain/models/story.dart';
import 'package:angelos_stories/ui/home/view_model/home_view_model.dart';
import 'package:angelos_stories/ui/home/widgets/add_story_dialog.dart';
import 'package:angelos_stories/ui/home/widgets/animated_button.dart';

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

                Image.asset('assets/img/anoldmanstalking.gif', cacheHeight: 300, cacheWidth: 400),
                Text('Every story comes from a man who wants to tell it, whether you want it or not.').thin,
                Text('- Angelo R.').xSmall,
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SizedBox(
                      width: 600,
                      height: 160,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            child: AnimatedButton(
                              title: 'I am Angelo',
                              icon: LucideIcons.feather,
                              image: 'assets/img/newstory.gif',
                              backgroundColor: Colors.orange,
                              textColor: Colors.white,
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

                                final js = jsonDecode(s);

                                ref.read(homeViewModelProvider.notifier).addStory(Story.fromJson(js));
                              },
                            ),
                          ),
                          Expanded(
                            child: AnimatedButton(
                              title: 'I\'m not Angelo',
                              icon: LucideIcons.bookHeart,
                              image: 'assets/img/stories.gif',
                              backgroundColor: Colors.orange,
                              textColor: Colors.white,
                              onPressed: () => context.pushNamed('stories'),
                            ),
                          ),
                          Expanded(
                            child: AnimatedButton(
                              title: 'Stats',
                              icon: LucideIcons.chartArea,
                              image: 'assets/img/poster.gif',
                              backgroundColor: Colors.orange,
                              textColor: Colors.white,
                              onPressed: () async => context.pushNamed('stats'),
                            ),
                          ),
                        ],
                      ).gap(12),
                    ),
                  ),
                ),

                SizedBox(
                  width: 300,
                  height: 150,
                  child: AnimatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Boomerctionary'),

                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [const Text('Are you a boomer?'), const Gap(16), Image.asset('assets/img/boomer.gif')],
                            ),
                            actions: [
                              DestructiveButton(
                                onPressed: () {
                                  context.pushNamed('boomerctionary');
                                  context.pop();
                                },
                                child: const Text('No (Yes)'),
                              ),
                              SecondaryButton(
                                onPressed: () {
                                  context.pushNamed('boomerctionary');
                                  context.pop();
                                },
                                child: const Text('Yes'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    textColor: Colors.white,
                    title: "Am I a boomer?",
                    icon: LucideIcons.badgeInfo,
                    image: 'assets/img/boomerctionary.gif',
                    backgroundColor: Colors.orange,
                  ),
                ),
                const Gap(16),
                Text('This app is open source!').xSmall,

                OutlineButton(
                  trailing: const Icon(LucideIcons.github),
                  child: const Text('GitHub'),
                  onPressed: () => launchUrl(Uri.parse('https://github.com/Maryusz/angelos_stories')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
