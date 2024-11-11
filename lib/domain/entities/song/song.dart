import 'package:cloud_firestore/cloud_firestore.dart';

class SongEntity {
  final String artist;
  final String title;
  final num duration;
  final Timestamp releaseDate;
  final bool isFavourite;
  final String songId;

  SongEntity({
    required this.artist,
    required this.title,
    required this.duration,
    required this.releaseDate,
    required this.isFavourite,
    required this.songId,
  });
}
