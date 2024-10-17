import 'package:dartz/dartz.dart';
import 'package:spotify/data/models/auth/create_user_request.dart';

abstract class AuthRepository {
  Future<Either> signUp(CreateUserRequest createUserReq);
  Future<void> signIn();
}
