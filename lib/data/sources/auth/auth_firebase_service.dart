abstract class AuthFirebaseService {
  Future<void> signUp();
  Future<void> signIn();
}

class AuthFirebaseServiceImpl implements AuthFirebaseService {
  @override
  Future<void> signIn() {
    throw UnimplementedError();
  }

  @override
  Future<void> signUp() {
    throw UnimplementedError();
  }
}
