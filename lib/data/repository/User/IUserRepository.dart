

abstract class IUserRepository {
  Future<void> signIn({required String email, required String password,});
  Future<void> register({required String username, required String email, required String password});
  //Future<User?> getUser();
  Future<void> signOut();
  Future<bool> isSignedIn();

}