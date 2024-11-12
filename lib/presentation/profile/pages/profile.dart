import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/common/helpers/is_dark_mode.dart';
import 'package:spotify/common/widgets/appbar/appbar.dart';
import 'package:spotify/presentation/profile/bloc/favourite_songs_cubit.dart';
import 'package:spotify/presentation/profile/bloc/favourite_songs_state.dart';
import 'package:spotify/presentation/profile/bloc/profile_info_cubit.dart';
import 'package:spotify/presentation/profile/bloc/profile_info_state.dart';
import 'package:spotify/presentation/song_player/pages/song_player.dart';

import '../../../common/widgets/favourite_button/favourite_button.dart';
import '../../../core/configs/constants/app_urls.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        backgroundColor: context.isDarkMode ? Color(0xFF2C2828) : Colors.white,
        title: Text("Profile"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _profileInfo(context),
          const SizedBox(
            height: 30,
          ),
          _favouriteSongs(),
        ],
      ),
    );
  }

  Widget _profileInfo(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileInfoCubit()..getUser(),
      child: Container(
        height: MediaQuery.of(context).size.height / 3.5,
        width: double.infinity,
        decoration: BoxDecoration(
          color: context.isDarkMode ? Color(0xFF2C2828) : Colors.white,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(60),
            bottomLeft: Radius.circular(60),
          ),
        ),
        child: BlocBuilder<ProfileInfoCubit, ProfileInfoState>(
            builder: (context, state) {
          if (state is ProfileInfoLoading) {
            return Container(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            );
          }
          if (state is ProfileInfoLoaded) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 110,
                  width: 110,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(state.userEntity.profileURL!),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Text(state.userEntity.email!),
                const SizedBox(height: 10),
                Text(
                  state.userEntity.fullName!,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            );
          }
          if (state is ProfileInfoFailure) {
            return const Text("Please try agin");
          }
          return Container();
        }),
      ),
    );
  }

  Widget _favouriteSongs() {
    return BlocProvider(
      create: (context) => FavoriteSongsCubit()..getFavoriteSongs(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "FAVOURITE SONGS",
            ),
            const SizedBox(height: 20),
            BlocBuilder<FavoriteSongsCubit, FavoriteSongsState>(
              builder: (context, state) {
                if (state is FavoriteSongsLoading) {
                  return const CircularProgressIndicator();
                }
                if (state is FavoriteSongsLoaded) {
                  return ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => SongPlayerPage(
                                songEntity: state.favoriteSongs[index],
                              ),
                            ),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          '${AppURLs.coverFirestorage}${state.favoriteSongs[index].artist} - ${state.favoriteSongs[index].title}.jpg?alt=media'),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      state.favoriteSongs[index].title,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      state.favoriteSongs[index].artist,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  state.favoriteSongs[index].duration
                                      .toString()
                                      .replaceAll('.', ':'),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                FavouriteButton(
                                  key: UniqueKey(),
                                  songEntity: state.favoriteSongs[index],
                                  function: () {
                                    context
                                        .read<FavoriteSongsCubit>()
                                        .removeSong(index);
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 20),
                    itemCount: state.favoriteSongs.length,
                  );
                }
                if (state is FavoriteSongsFailure) {
                  return const Text("Error try again");
                }
                return Container();
              },
            )
          ],
        ),
      ),
    );
  }
}
