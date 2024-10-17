import 'package:dartz/dartz.dart';
import 'package:spotify/data/models/auth/create_user_request.dart';
import 'package:spotify/data/models/auth/signin_user_request.dart';
import 'package:spotify/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify/domain/repository/auth/auth.dart';

import '../../../service_locator.dart';

class AuthRepositoryImp implements AuthRepository {
  @override
  Future<Either> signIn(SigninUserRequest signinUserReq) async {
    return await sl<AuthFirebaseService>().signIn(signinUserReq);
  }

  @override
  Future<Either> signUp(CreateUserRequest createUserReq) async {
    return await sl<AuthFirebaseService>().signUp(createUserReq);
  }
}
