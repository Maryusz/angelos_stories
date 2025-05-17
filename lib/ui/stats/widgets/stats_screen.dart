import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphic/graphic.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';

import 'package:angelos_stories/ui/stats/view_model/stats_view_model.dart';

class StatsScreen extends ConsumerWidget {
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final averageVote = ref.watch(statsViewModelProvider);
    return Scaffold(
      headers: [
        AppBar(title: const Text('Stats'), leading: [Icon(LucideIcons.chartArea)]),
      ],
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Stats'),
            const Gap(16),
            Image.asset('assets/img/stats.gif'),
            Gap(12),
            Expanded(
              child: switch (averageVote) {
                AsyncError(:final error) => Text("$error"),
                AsyncData(:final value) => Chart(
                  data: value,

                  variables: {
                    'title': Variable(accessor: (Map map) => map['title'] as String),
                    'vote': Variable(accessor: (Map map) => map['vote'] as num, scale: LinearScale(min: 0, max: 5)),
                  },
                  marks: [IntervalMark()],
                  axes: [Defaults.horizontalAxis, Defaults.verticalAxis],
                ),
                _ => SizedBox(height: 50, width: 50, child: Center(child: const CircularProgressIndicator())),
              },
            ),
          ],
        ),
      ),
    );
  }
}


// Chart(
//                 data: [
//                   {'genre': 'Sports', 'sold': 275},
//                   {'genre': 'Strategy', 'sold': 115},
//                   {'genre': 'Action', 'sold': 120},
//                   {'genre': 'Shooter', 'sold': 350},
//                   {'genre': 'Other', 'sold': 150},
//                 ],
//                 variables: {
//                   'genre': Variable(accessor: (Map map) => map['genre'] as String),
//                   'sold': Variable(accessor: (Map map) => map['sold'] as num),
//                 },

//                 marks: [IntervalMark()],
//                 axes: [Defaults.horizontalAxis, Defaults.verticalAxis],
//               ),