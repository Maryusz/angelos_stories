import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

import 'package:angelos_stories/ui/boomerctionary/widgets/boomerctionary_screen.dart';
import 'package:angelos_stories/ui/home/widgets/home_screen.dart';
import 'package:angelos_stories/ui/stats/widgets/stats_screen.dart';
import 'package:angelos_stories/ui/story_list/widgets/story_list_screen.dart';
part 'router.g.dart';

@riverpod
GoRouter goRouter(Ref ref) {
  return GoRouter(
    routes: [
      GoRoute(
        path: '/',
        name: 'home',
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            child: HomeScreen(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return FadeTransition(opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation), child: child);
            },
          );
        },
        builder: (context, state) {
          return const HomeScreen();
        },

        routes: [
          GoRoute(
            path: 'stories',
            name: 'stories',
            builder: (context, state) {
              return StoryListScreen();
            },
            pageBuilder: (context, state) {
              return CustomTransitionPage(
                child: StoryListScreen(),
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation), child: child);
                },
              );
            },
          ),
          GoRoute(
            path: 'stats',
            name: 'stats',
            builder: (context, state) {
              return StatsScreen();
            },
            pageBuilder: (context, state) {
              return CustomTransitionPage(
                child: StatsScreen(),
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation), child: child);
                },
              );
            },
          ),
          GoRoute(
            path: 'boomerctionary',
            name: 'boomerctionary',
            builder: (context, state) {
              return BoomerctionaryScreen();
            },
            pageBuilder: (context, state) {
              return CustomTransitionPage(
                child: BoomerctionaryScreen(),
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  return FadeTransition(opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation), child: child);
                },
              );
            },
          ),
        ],
      ),
    ],
    initialLocation: '/',
  );
}
