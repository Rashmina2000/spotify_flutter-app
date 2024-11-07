import 'package:flutter/material.dart';
import 'package:spotify/common/widgets/appbar/appbar.dart';
import 'package:spotify/domain/entities/song/song.dart';

import '../../../core/configs/constants/app_urls.dart';
import '../../../core/configs/theme/app_colors.dart';

class SongPlayerPage extends StatelessWidget {
  final SongEntity songEntity;
  const SongPlayerPage({required this.songEntity, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: Text(
          "Now playing",
          style: TextStyle(fontSize: 18),
        ),
        action: IconButton(
          onPressed: () {},
          icon: Icon(Icons.more_vert_rounded),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Column(
          children: [
            _songCover(context),
            SizedBox(height: 20),
            _songDetail(),
          ],
        ),
      ),
    );
  }

  Widget _songCover(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            '${AppURLs.coverFirestorage}${songEntity.artist} - ${songEntity.title}.jpg?alt=media',
          ),
        ),
      ),
    );
  }

  Widget _songDetail() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              songEntity.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            SizedBox(height: 5),
            Text(
              songEntity.artist,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.favorite_outline_outlined,
            color: AppColors.darkGrey,
            size: 35,
          ),
        ),
      ],
    );
  }
}
