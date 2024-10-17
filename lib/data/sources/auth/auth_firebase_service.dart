import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify/data/models/auth/create_user_request.dart';

abstract class AuthFirebaseService {
  Future<Either> signUp(CreateUserRequest createUserReq);
  Future<void> signIn();
}

class AuthFirebaseServiceImpl implements AuthFirebaseService {
  @override
  Future<void> signIn() {
    throw UnimplementedError();
  }

  @override
  Future<Either> signUp(CreateUserRequest createUserReq) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: createUserReq.email,
        password: createUserReq.password,
      );
      return Right("Signup successfull");
    } on FirebaseAuthException catch (e) {
      String message = "";
      if (e.code == 'weak-password') {
        message = "Password is too weak";
      } else if (e.code == 'email-already-in-use') {
        message = "Email already exist";
      }
      return Left(message);
    }
  }
}
