class Supabase {
  static final Supabase instance = Supabase();
  final client = SupabaseClient();
}

class SupabaseClient {
  final auth = SupabaseAuth();
}

class SupabaseAuth {
  Future<void> signUp({required String email, required String password}) async {}
  Future<void> resetPasswordForEmail(String email) async {}
  Future<void> verifyOTP({required String token, required OtpType type}) async {}
  Future<void> updateUser(UserAttributes attr) async {}
}

class AuthException implements Exception {}

enum OtpType { recovery }

class UserAttributes {
  final String password;
  UserAttributes({required this.password});
}
