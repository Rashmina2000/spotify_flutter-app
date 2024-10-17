import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify/data/models/auth/create_user_request.dart';

abstract class AuthFirebaseService {
  Future<void> signUp(CreateUserRequest createUserReq);
  Future<void> signIn();
}

class AuthFirebaseServiceImpl implements AuthFirebaseService {
  @override
  Future<void> signIn() {
    throw UnimplementedError();
  }

  @override
  Future<void> signUp(CreateUserRequest createUserReq) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: createUserReq.email,
        password: createUserReq.password,
      );
    } on FirebaseAuthException catch (e) {}
  }
}
