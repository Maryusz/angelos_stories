import 'package:flutter/material.dart' as std;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:angelos_stories/ui/boomerctionary/view_model/boomerctionary_view_model.dart';

class BoomerctionaryScreen extends ConsumerWidget {
  const BoomerctionaryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final boomerctionary = ref.watch(boomerctionaryDefinitionsProvider);
    return Scaffold(
      headers: [
        AppBar(title: const Text('Boomerctionary'), leading: [Icon(LucideIcons.bookPlus)]),
      ],
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Boomerctionary'),
            const Gap(16),
            Image.asset('assets/img/boomerctionary.gif', cacheHeight: 300, cacheWidth: 400),
            const Gap(12),
            const Text('Here you can find some references if you don\'t understand the references.').italic,

            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(8),

                itemCount: boomerctionary.length,
                itemBuilder: (context, index) {
                  final definition = boomerctionary[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SurfaceCard(
                      child: std.ListTile(
                        title: Text(definition.title),
                        subtitle: Text(definition.description),
                        trailing: SecondaryButton(
                          child: Icon(LucideIcons.externalLink),
                          onPressed: () {
                            launchUrl(definition.videoUrl!, mode: LaunchMode.externalApplication);
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
