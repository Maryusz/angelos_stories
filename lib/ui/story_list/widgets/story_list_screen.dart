import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

import 'package:angelos_stories/ui/story_list/view_model/story_list_view_model.dart';
import 'package:angelos_stories/ui/vote/widgets/vote_screen.dart';
import 'package:angelos_stories/ui/vote/widgets/voter.dart';

class StoryListScreen extends ConsumerStatefulWidget {
  const StoryListScreen({super.key});

  @override
  ConsumerState<StoryListScreen> createState() => _StoryListScreenState();
}

class _StoryListScreenState extends ConsumerState<StoryListScreen> {
  final controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    final viewModel = ref.watch(storyListViewModelProvider);

    return Scaffold(
      headers: [
        AppBar(
          title: const Text('Stories'),
          leading: [OutlineButton(child: Icon(LucideIcons.arrowLeft), onPressed: () => context.pop())],
          trailing: [Icon(LucideIcons.bookOpen)],
        ),
      ],
      child: switch (viewModel) {
        AsyncError(:final error) => Padding(padding: const EdgeInsets.all(32.0), child: Center(child: Text('Error: $error'))),
        AsyncData(:final value) =>
          value.isEmpty
              ? Padding(
                padding: const EdgeInsets.all(32.0),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [const Text('No stories'), const Gap(16), Image.asset('assets/img/nothing.gif'), const Gap(12)],
                  ),
                ),
              )
              : Padding(
                padding: const EdgeInsets.all(32.0),
                child: SizedBox(
                  width: 800,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.8,
                          child: Carousel(
                            transition: const CarouselTransition.sliding(),
                            controller: controller,
                            draggable: false,
                            itemCount: value.length,
                            itemBuilder: (context, index) {
                              return Card(
                                child: Column(
                                  spacing: 8,
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Expanded(flex: 6, child: Text(value[index].title).xLarge),
                                        Expanded(flex: 2, child: Text("Angelo ${(value[index].id ~/ 10) + 1}:${value[index].id}").thin),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 50,
                                      width: 300,
                                      child: Padding(padding: const EdgeInsets.all(8.0), child: VoteScreen(storyId: value[index].id)),
                                    ),
                                    Expanded(child: SingleChildScrollView(child: Text(value[index].story).small)),
                                    const Gap(8),
                                    OverflowBar(spacing: 8, children: [Voter(key: UniqueKey(), storyId: value[index].id)]),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      const Gap(8),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          switch (viewModel) {
                            AsyncError(:final error) => Text('Error: $error'),
                            AsyncData(:final value) => CarouselDotIndicator(itemCount: value.length, controller: controller),
                          },
                          const Spacer(),
                          OutlineButton(
                            shape: ButtonShape.circle,
                            onPressed: () {
                              controller.animatePrevious(const Duration(milliseconds: 500));
                            },
                            child: const Icon(Icons.arrow_back),
                          ),
                          const Gap(8),
                          OutlineButton(
                            shape: ButtonShape.circle,
                            onPressed: () {
                              controller.animateNext(const Duration(milliseconds: 500));
                            },
                            child: const Icon(Icons.arrow_forward),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
        _ => Center(child: SizedBox(width: 50, height: 50, child: const CircularProgressIndicator())),
      },
    );
  }
}
