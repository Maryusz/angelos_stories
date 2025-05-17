import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shadcn_flutter/shadcn_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:angelos_stories/routing/router.dart';
import 'package:angelos_stories/utils/env_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(url: EnvService.supabaseUrl, anonKey: EnvService.supabaseApiKey);

  runApp(ProviderScope(child: const MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ShadcnApp.router(
      routerConfig: ref.watch(goRouterProvider),
      theme: ThemeData(colorScheme: ColorSchemes.lightOrange(), radius: 0.7),
    );
  }
}
