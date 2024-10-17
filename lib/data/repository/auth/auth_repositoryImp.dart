import 'package:spotify/data/models/auth/create_user_request.dart';
import 'package:spotify/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify/domain/repository/auth/auth.dart';

import '../../../service_locator.dart';

class AuthRepositoryImp implements AuthRepository {
  @override
  Future<void> signIn() {
    throw UnimplementedError();
  }

  @override
  Future<void> signUp(CreateUserRequest createUserReq) async {
    await sl<AuthFirebaseService>().signUp(createUserReq);
  }
}
