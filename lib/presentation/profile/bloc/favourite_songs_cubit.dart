import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/domain/usecases/song/get_favourite_songs.dart';

import '../../../domain/entities/song/song.dart';
import '../../../service_locator.dart';
import 'favourite_songs_state.dart';

class FavoriteSongsCubit extends Cubit<FavoriteSongsState> {
  FavoriteSongsCubit() : super(FavoriteSongsLoading());

  List<SongEntity> favoriteSongs = [];

  Future<void> getFavoriteSongs() async {
    var result = await sl<GetFavouriteSongsUseCase>().call();
    result.fold(
      (l) {
        emit(FavoriteSongsFailure());
      },
      (r) {
        favoriteSongs = r;
        emit(FavoriteSongsLoaded(favoriteSongs: favoriteSongs));
      },
    );
  }

  void removeSong(int index) {
    favoriteSongs.removeAt(index);
    emit(FavoriteSongsLoaded(favoriteSongs: favoriteSongs));
  }
}
