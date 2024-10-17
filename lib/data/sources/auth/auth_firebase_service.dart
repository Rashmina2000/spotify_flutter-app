import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify/data/models/auth/create_user_request.dart';
import 'package:spotify/data/models/auth/signin_user_request.dart';

abstract class AuthFirebaseService {
  Future<Either> signUp(CreateUserRequest createUserReq);
  Future<Either> signIn(SigninUserRequest signinUserReq);
}

class AuthFirebaseServiceImpl implements AuthFirebaseService {
  @override
  Future<Either> signIn(SigninUserRequest signinUserReq) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: signinUserReq.email,
        password: signinUserReq.password,
      );

      return const Right('Signin was Successful');
    } on FirebaseAuthException catch (e) {
      String message = 'Error';

      if (e.code == 'invalid-credential') {
        message = 'Invalid email or password';
      }

      return Left(message);
    }
  }

  @override
  Future<Either> signUp(CreateUserRequest createUserReq) async {
    try {
      var data = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: createUserReq.email,
        password: createUserReq.password,
      );
      FirebaseFirestore.instance.collection('Users').doc(data.user?.uid).set({
        'name': createUserReq.fullName,
        'email': data.user?.email,
      });
      return Right("Signup successfull");
    } on FirebaseAuthException catch (e) {
      String message = e.toString();
      print(message);
      if (e.code == 'weak-password') {
        message = "Password is too weak";
      } else if (e.code == 'email-already-in-use') {
        message = "Email already exist";
      }
      return Left(message);
    }
  }
}
