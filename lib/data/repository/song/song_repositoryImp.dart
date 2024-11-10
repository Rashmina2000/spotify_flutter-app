import 'package:dartz/dartz.dart';
import 'package:spotify/data/sources/song/song_firebase_service.dart';
import 'package:spotify/domain/repository/song/song.dart';

import '../../../service_locator.dart';

class SongRepositoryImp extends SongRepository {
  @override
  Future<Either> getNewsSongs() async {
    return await sl<SongFirebaseService>().getNewsSongs();
  }

  @override
  Future<Either> getPlayList() async {
    return await sl<SongFirebaseService>().getPlayList();
  }

  @override
  Future<Either> addOrRemoveFavouriteSong(String songId) {
    // TODO: implement addOrRemoveFavouriteSong
    throw UnimplementedError();
  }

  @override
  Future<bool> isFavouriteSong(String songId) {
    // TODO: implement isFavouriteSong
    throw UnimplementedError();
  }
}
