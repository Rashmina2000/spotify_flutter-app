import 'package:dartz/dartz.dart';
import 'package:spotify/core/usecase/usecase.dart';
import 'package:spotify/data/models/auth/signin_user_request.dart';
import 'package:spotify/domain/repository/auth/auth.dart';
import 'package:spotify/service_locator.dart';

class SigninUseCase implements UseCase<Either, SigninUserRequest> {
  @override
  Future<Either> call({SigninUserRequest? params}) async {
    return sl<AuthRepository>().signIn(params!);
  }
}
