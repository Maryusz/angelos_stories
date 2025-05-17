import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
part 'dependencies.g.dart';

@riverpod
SupabaseClient supabaseClient(Ref ref) {
  // Get a reference your Supabase client
  final supabase = Supabase.instance.client;
  return supabase;
}
