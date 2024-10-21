import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spotify/domain/entities/song/song.dart';

class SongModel {
  String? artist;
  String? title;
  num? duration;
  Timestamp? releaseDate;

  SongModel({
    required this.artist,
    required this.title,
    required this.duration,
    required this.releaseDate,
  });

  SongModel.fromJson(Map<String, dynamic> data) {
    artist = data['artist'];
    title = data['title'];
    duration = data['duration'];
    releaseDate = data['releaseDate'];
  }
}

extension SongModelx on SongModel {
  SongEntity toEntity() {
    return SongEntity(
      title: title!,
      artist: artist!,
      duration: duration!,
      releaseDate: releaseDate!,
    );
  }
}
