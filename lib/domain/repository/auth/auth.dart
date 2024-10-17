import 'package:spotify/data/models/auth/create_user_request.dart';

abstract class AuthRepository {
  Future<void> signUp(CreateUserRequest createUserReq);
  Future<void> signIn();
}
