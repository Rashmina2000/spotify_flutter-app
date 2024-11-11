import 'package:get_it/get_it.dart';
import 'package:spotify/data/repository/auth/auth_repositoryImp.dart';
import 'package:spotify/data/repository/song/song_repositoryImp.dart';
import 'package:spotify/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify/data/sources/song/song_firebase_service.dart';
import 'package:spotify/domain/repository/auth/auth.dart';
import 'package:spotify/domain/repository/song/song.dart';
import 'package:spotify/domain/usecases/auth/getUser.dart';
import 'package:spotify/domain/usecases/auth/signin.dart';
import 'package:spotify/domain/usecases/auth/signup.dart';
import 'package:spotify/domain/usecases/song/add_or_remove_favourite_song.dart';
import 'package:spotify/domain/usecases/song/get_news_songs.dart';
import 'package:spotify/domain/usecases/song/get_play_list.dart';
import 'package:spotify/domain/usecases/song/is_favourite_song.dart';

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

  sl.registerSingleton<SigninUseCase>(
    SigninUseCase(),
  );

  sl.registerSingleton<SongFirebaseService>(
    SongFirebaseServiceImp(),
  );

  sl.registerSingleton<SongRepository>(
    SongRepositoryImp(),
  );

  sl.registerSingleton<GetNewsSongsUseCase>(
    GetNewsSongsUseCase(),
  );

  sl.registerSingleton<GetPlayListUseCase>(
    GetPlayListUseCase(),
  );

  sl.registerSingleton<AddOrRemoveFavoriteSongUseCase>(
    AddOrRemoveFavoriteSongUseCase(),
  );

  sl.registerSingleton<IsFavoriteSongUseCase>(
    IsFavoriteSongUseCase(),
  );

  sl.registerSingleton<GetUserUseCase>(
    GetUserUseCase(),
  );
}
