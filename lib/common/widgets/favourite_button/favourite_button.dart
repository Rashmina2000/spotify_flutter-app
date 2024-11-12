import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/common/bloc/favourite_button/favourite_button_cubit.dart';
import 'package:spotify/common/bloc/favourite_button/favourite_button_state.dart';
import 'package:spotify/domain/entities/song/song.dart';

import '../../../core/configs/theme/app_colors.dart';

class FavouriteButton extends StatelessWidget {
  final SongEntity songEntity;
  final Function? function;
  const FavouriteButton({super.key, required this.songEntity, this.function});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoriteButtonCubit(),
      child: BlocBuilder<FavoriteButtonCubit, FavoriteButtonState>(
        builder: (context, state) {
          if (state is FavoriteButtonInitial) {
            return IconButton(
              onPressed: () async {
                await context
                    .read<FavoriteButtonCubit>()
                    .favoriteButtonUpdated(songEntity.songId);
                if (function != null) {
                  function!();
                }
              },
              icon: Icon(
                songEntity.isFavourite
                    ? Icons.favorite
                    : Icons.favorite_outline_outlined,
                color: AppColors.darkGrey,
                size: 25,
              ),
            );
          }
          if (state is FavoriteButtonUpdated) {
            return IconButton(
              onPressed: () async {
                await context
                    .read<FavoriteButtonCubit>()
                    .favoriteButtonUpdated(songEntity.songId);
              },
              icon: Icon(
                state.isFavorite
                    ? Icons.favorite
                    : Icons.favorite_outline_outlined,
                color: AppColors.darkGrey,
                size: 25,
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
