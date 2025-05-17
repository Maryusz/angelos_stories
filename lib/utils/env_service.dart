class EnvService {
  static const String supabaseUrl = String.fromEnvironment("SUPABASE_URL", defaultValue: '');
  static const String supabaseApiKey = String.fromEnvironment("SUPABASE_API_KEY", defaultValue: '');
}
