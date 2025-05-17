import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:angelos_stories/domain/models/boomer_definition.dart';

part 'boomerctionary_view_model.g.dart';

@riverpod
List<BoomerDefinition> boomerctionaryDefinitions(Ref ref) {
  return [
    BoomerDefinition(
      title: 'Lemon tree story',
      description: 'Grandpa Simposon tells the story about the lemon tree.',
      videoUrl: Uri.parse('https://youtu.be/34YeyBo0_k0?t=107'),
    ),

    // Add more definitions as needed
  ];
}
