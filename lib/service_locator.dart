import 'package:get_it/get_it.dart';
import 'package:spotify/data/repository/auth/auth_repositoryImp.dart';
import 'package:spotify/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify/domain/repository/auth/auth.dart';
import 'package:spotify/domain/usecases/auth/signup.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<AuthFirebaseService>(
    AuthFirebaseServiceImpl(),
  );

  sl.registerSingleton<AuthRepository>(
    AuthRepositoryImp(),
  );

  sl.registerSingleton<SignupUseCase>(
    SignupUseCase(),
  );
}
