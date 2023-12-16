abstract class AuthenticationRepository {
  Future<void> signIn(String email, String password);
  Future<void> signUp(String email, String password);
}
