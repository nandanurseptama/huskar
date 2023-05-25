/// Creates Auth Repository
///
/// Handling Authentication Logic
///
/// Interact with Local Data and
///
/// API
abstract class AuthRepository {
  /// Authenticate
  ///
  /// return email if authenticated
  ///
  /// return null if not authenticated
  ///
  /// throw failure if fail
  Future<String?> authenticate(
    String processId,
  );

  /// Login
  ///
  /// return email if success
  ///
  /// throw Failure if fail
  Future<String> login({
    required String processId,
    required String email,
    required String password,
  });

  /// Logout
  ///
  /// Logouting user by clearing local data
  Future<void> logout(String processId);
}
